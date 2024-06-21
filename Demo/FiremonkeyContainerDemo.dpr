program FiremonkeyContainerDemo;

uses
  Vcl.Forms,
  VCLForm in 'VCLForm.pas' {Form1},
  FMXForm in 'FMXForm.pas' {FireMonkeyForm},
  FMX3DForm in 'FMX3DForm.pas' {FormExample3D};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
