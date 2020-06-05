unit PRINCIPALgame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, classeJogo, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Timer1: TTimer;
    Tcreate: TTimer;
    TAumenta: TTimer;
    TVencedor: TTimer;
    Tnivel: TTimer;
    lblNivel: TLabel;
    Tnivel2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure TcreateTimer(Sender: TObject);
    procedure TVencedorTimer(Sender: TObject);
    procedure TnivelTimer(Sender: TObject);
    procedure Tnivel2Timer(Sender: TObject);
    //procedure TAumentaTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  jogo: Tjogo;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin

  DoubleBuffered := true;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key  of
    VK_LEFT : jogo.MoveEsquerda;
    VK_RIGHT : jogo.MoveDireita;
    VK_UP : jogo.MoveCima;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var i: integer;
begin


       lblNivel.Visible := false;
       lblNivel.Parent := Panel1;

  jogo := Tjogo.Create(Panel1,Panel2);
  jogo.inicializar(Panel1, Panel2);


      TCreate.Enabled := true;
      TCreate.Interval := 2000;
      Timer1.Enabled := true;
      Timer1.Interval := 100;
      TAumenta.Enabled := true;
      TAumenta.Interval := 2000;
      TVencedor.Enabled:= true;
      TVencedor.Interval := 40000;
      Tnivel.Enabled := true;
      Tnivel.Interval := 20000;
      Tnivel2.Enabled := true;
      Tnivel2.Interval := 21000;



end;

{
procedure TForm1.TAumentaTimer(Sender: TObject);
var i : integer;
begin

      for i := 0 to Panel1.ComponentCount-1 do
        begin
          if Panel1.Components[i] is Timage then
          begin
             if TPanel(Panel1.Components[i]).tag =1 then
             begin


               if(((TPanel(Panel1.Components[i]).Height) <= 91) and ((TPanel(Panel1.Components[i]).Width) <= 75))  then
                 begin

                  TPanel(Panel1.Components[i]).Height := TPanel(Panel1.Components[i]).Height+1;
                  TPanel(Panel1.Components[i]).Width := TPanel(Panel1.Components[i]).Width +1;

                 end;

             end;

          end;
        end;









end;




}


procedure TForm1.TcreateTimer(Sender: TObject);
begin

           jogo.CriaCarroInimigo(jogo);
           jogo.CriaCacto(jogo);
end;

procedure TForm1.Tnivel2Timer(Sender: TObject);
begin
       lblNivel.Visible := false;
end;

procedure TForm1.TnivelTimer(Sender: TObject);
begin
            lblNivel.Visible := true;
            jogo.IncrementaNível(jogo);




end;
procedure TForm1.Timer1Timer(Sender: TObject);

begin

          jogo.MoveCarroInimigo(jogo);



end;



procedure TForm1.TVencedorTimer(Sender: TObject);
begin

     //Timer1.Enabled := false;

end;

end.
