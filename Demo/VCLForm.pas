unit VCLForm;

interface

uses
  FMX.Forms { must be included before Vcl.Forms so that 'TForm' below refers to a VCL form, not FMX},
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMXForm, FMX3DForm, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls,
  FMX.Container;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnOpenAnotherForm: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    btnDrag: TButton;
    Label3: TLabel;
    procedure btnOpenAnotherFormClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FireMonkeyContainer1: TFireMonkeyContainer;
    FireMonkeyContainer2: TFireMonkeyContainer;
    procedure FireMonkeyContainer1CreateFMXForm(var Form: TCommonCustomForm);
    procedure FireMonkeyContainer1DestroyFMXForm(var Form: TCommonCustomForm;
      var Action: TCloseHostedFMXFormAction);
    procedure FireMonkeyContainer2CreateFMXForm(var Form: TCommonCustomForm);
    procedure FireMonkeyContainer2DestroyFMXForm(var Form: TCommonCustomForm;
      var Action: TCloseHostedFMXFormAction);
    procedure FireMonkeyContainerDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FireMonkeyContainerDragDrop(Sender, Source: TObject; X, Y: Integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnOpenAnotherFormClick(Sender: TObject);
begin
  TForm1.Create(Application).Show;
end;

procedure TForm1.FireMonkeyContainer1CreateFMXForm(var Form: TCommonCustomForm);
begin
  if not Assigned(Form) then Form := TFireMonkeyForm.Create(nil);
end;

procedure TForm1.FireMonkeyContainer1DestroyFMXForm(var Form: TCommonCustomForm;
  var Action: TCloseHostedFMXFormAction);
begin
  Action := fcaFree;
end;

procedure TForm1.FireMonkeyContainer2CreateFMXForm(var Form: TCommonCustomForm);
begin
  Form := TFormExample3D.Create(Application);
end;

procedure TForm1.FireMonkeyContainer2DestroyFMXForm(var Form: TCommonCustomForm;
  var Action: TCloseHostedFMXFormAction);
begin
  Action := fcaNone;
end;

procedure TForm1.FireMonkeyContainerDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FireMonkeyContainer1:= TFireMonkeyContainer.Create(self);
  FireMonkeyContainer1.Parent := Panel1;
  FireMonkeyContainer1.Align := alClient;
  FireMonkeyContainer1.OnCreateFMXForm := FireMonkeyContainer1CreateFMXForm;
  FireMonkeyContainer1.OnDestroyFMXForm := FireMonkeyContainer1DestroyFMXForm;
  FireMonkeyContainer1.OnDragDrop := FireMonkeyContainerDragDrop;
  FireMonkeyContainer1.OnDragOver := FireMonkeyContainerDragOver;

  FireMonkeyContainer2:= TFireMonkeyContainer.Create(self);
  FireMonkeyContainer2.Parent := Panel2;
  FireMonkeyContainer2.Align := alClient;
  FireMonkeyContainer2.OnCreateFMXForm := FireMonkeyContainer2CreateFMXForm;
  FireMonkeyContainer2.OnDestroyFMXForm := FireMonkeyContainer2DestroyFMXForm;
  FireMonkeyContainer2.OnDragDrop := FireMonkeyContainerDragDrop;
  FireMonkeyContainer2.OnDragOver := FireMonkeyContainerDragOver;
end;

procedure TForm1.FireMonkeyContainerDragDrop(Sender, Source: TObject; X, Y: Integer);
  function GetObjectInfo(const Obj : TObject) : string;
  begin
    if not Assigned(Obj) then Exit('nil');
    Result := Obj.ClassName;
    if Obj is TComponent then
      Result := (Obj as TComponent).Name;
    if Obj is TFireMonkeyContainer then
      Result := Result + ' which contains ' + GetObjectInfo((Obj as TFireMonkeyContainer).FireMonkeyForm);
  end;
var
  DragInfo : string;
begin
  DragInfo := 'You dragged ' + GetObjectInfo(Source) + ' onto ' + GetObjectInfo(Sender) + '.'
    + #13 + 'Mouse coords: ' + IntToStr(X) + ', ' + IntToStr(Y);
  MessageDlg(DragInfo, TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
end;



end.
