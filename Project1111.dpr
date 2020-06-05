program Project1111;

uses
  Vcl.Forms,
  PRINCIPALgame in 'PRINCIPALgame.pas' {Form1},
  jogoprincipal in '..\jogoprincipal.pas',
  classeJogo in 'classeJogo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
