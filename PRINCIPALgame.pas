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

      //cria carros
      TCreate.Enabled := true;
      TCreate.Interval := 2000;

      // Movimentar carros
      Timer1.Enabled := true;
      Timer1.Interval := 100;



      //Se não bater durante esse tempo aparece a linha de chegada
      TVencedor.Enabled:= true;
      TVencedor.Interval := 25000;

      //quando começa o nivel 2
      Tnivel.Enabled := true;
      Tnivel.Interval := 20000;

      //serve somente para apagar a escrita de nivel 2 da tela que deve durar um seg
      Tnivel2.Enabled := true;
      Tnivel2.Interval := 21000;



end;


procedure TForm1.TcreateTimer(Sender: TObject);
begin

           jogo.CriaCarroInimigo(jogo);

end;

procedure TForm1.Tnivel2Timer(Sender: TObject);
begin
       lblNivel.Visible := false;
end;

procedure TForm1.TnivelTimer(Sender: TObject);
begin
            lblNivel.Visible := true;
            jogo.IncrementaNível(jogo);
            jogo.CriaCacto(jogo);



end;
procedure TForm1.Timer1Timer(Sender: TObject);

begin

          jogo.MoveCarroInimigo(jogo,Tnivel2,TCreate,Tnivel,Timer1);



end;



procedure TForm1.TVencedorTimer(Sender: TObject);
begin
        form1.canvas.textOut(0,0, 'AAAAAAAAAAA');
      //nao posso desabilitar pq os carros tem q sair da tela completamente
     //Timer1.Enabled := false;
     TCreate.Enabled := false;
     Tnivel.Enabled := false;
     Tnivel2.Enabled := false;



end;

end.
