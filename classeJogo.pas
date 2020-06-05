unit classeJogo;

interface

uses Vcl.ExtCtrls, Vcl.Controls, Vcl.Dialogs, Vcl.MPlayer, pngimage, Jpeg, Windows;

type
  Tjogo = class

  private

  {Declaracoes privadas}
  TCriador    :TTimer;
  TMover      :TTimer;
  TNivel      :TTimer;

  count       :integer;
  bateu       :boolean;
  NumCarros   :integer;
  NumCacto    :integer;
  nivel       :integer;

  Tela        :TwinControl;
  Tela2       :TwinControl;
  Carro       :TImage;
  CarroDir    :TImage;
  CarroEsq    :TImage;
  Batida      :TImage;


  function VerificaColisao(o1, o2: TControl) : boolean;




  procedure exibeBatida;



  public
  painel : Tpanel;
  painel2 : Tpanel;
  //lblNivel  : Tlabel;
  constructor Create(Panel1 : TPanel;   Panel2 : Tpanel);
  procedure MoveEsquerda;
  procedure MoveDireita;
  procedure MoveCima;
  procedure inicializar(T:TwinControl; C: TWinControl);
  procedure MoveCarroInimigo(Sender:TObject);
  procedure CriaCarroInimigo(Sender:TObject);
  procedure IncrementaN�vel(Sender:TObject);
  procedure CriaCacto(Sender: TObject);

  //procedure MoveCacto(Sender: TObject);

  end;

implementation


  constructor Tjogo.Create(Panel1 : TPanel; Panel2 : Tpanel);

  begin
       painel := Panel1;
       painel2 := Panel2;
  end;





  procedure Tjogo.MoveEsquerda;
  var i: integer;
  begin
    //trocar imagem do carro para carro esquerda
    carro.Visible := false;
    carroDir.Visible:= false;

    carroEsq.Left := carro.Left;
    carroEsq.Top := carro.Top;
    carroEsq.Visible := true;

    carro.Left := carro.Left-1;
    carroDir.Left :=  carroDir.Left-1;
    carroEsq.Left := carroEsq.Left-1;



  end;


  procedure Tjogo.MoveDireita;

  begin
    //trocar imagem do carro para carro direita
    carro.Visible := false;
    carroEsq.Visible := false;
    carroDir.Left := carro.Left;
    carroDir.Top := carro.Top;
    carroDir.Visible:= true;

    carro.Left := carro.Left+1;
    carroDir.Left :=  carroDir.Left+1;
    carroEsq.Left := carroEsq.Left+1;


  end;


procedure Tjogo.CriaCarroInimigo(Sender: TObject);
    var t: TImage;
  begin
        TCriador.Enabled := true;
      inc(numCarros);
      if not bateu and (numCarros<6) then

        begin
          t          := timage.Create(tela);
          t.Parent   := tela;
          t.Picture.LoadFromFile('D:\Documentos\S�timo Per�odo\Delphi\TRABIGORtopgear\carrinho 01 png.png');
          t.Height  := 71;
          t.Width   := 55;
          t.Stretch := true;
          t.Visible := true;
          //t.proportional := true;
          t.top := 0;

          t.left := Random(tela.Width - 100);
          t.tag := 1;


        end;

  end;

{procedure MoveCacto(Sender: TObject);
  var i: integer;
  begin
 //MOVIMENTAR CACTOS

        for i := 0 to tela2.ComponentCount-1 do
        begin

          if (TPanel(tela2.Components[i]).tag =2) and (nivel > 1)then
          begin
                   TPanel(tela2.Components[i]).Top := TPanel(tela2.Components[i]).Top +1;

                   if ((TPanel(tela2.Components[i]).Height) <= 91) and ((TPanel(tela2.Components[i]).Width) <= 75) then
                 begin

                 TPanel(tela2.Components[i]).Height := TPanel(tela2.Components[i]).Height+2;
                 TPanel(tela2.Components[i]).Width := TPanel(tela2.Components[i]).Width +2;

                 end;


               //Se sair da tela volta pro topo
               if ((TPanel(tela2.Components[i])).Top > tela2.Height)  then
                begin
                  count := count+1;
                if(count<=20) then
                begin

                  Tpanel(tela2.Components[i]).Top := 0;
                  Tpanel(tela2.Components[i]).Left := Random(tela.Width-30);
                  Tpanel(tela2.Components[i]).Width :=  55;
                  Tpanel(tela2.Components[i]).Height := 71;

                end;


             end;

          end;

         end;




end;
}

procedure Tjogo.CriaCacto(Sender: TObject);
    var c: TImage;
  begin

      inc(numCacto);
      if not bateu and (numCacto<6) then

        begin
          c          := timage.Create(tela);
          c.Parent   := tela2;
          c.Picture.LoadFromFile('D:\Documentos\S�timo Per�odo\Delphi\TRABIGORtopgear\cacto.png');
          c.Height  := 71;
          c.Width   := 55;
          c.Stretch := true;
          c.Visible := true;
          //t.proportional := true;
          c.top := 0;

          //c.left := Random(tela.Width - 100);
          c.Left := 0;
          c.tag := 2;


        end;

  end;


procedure Tjogo.MoveCarroInimigo(Sender: TObject);

   var
    i : Integer;

   begin

      if not bateu then
      begin

        for i := 0 to tela.ComponentCount-1 do
        begin
          if tela.Components[i] is Timage then
          begin
             if TPanel(tela.Components[i]).tag =1 then
             begin



               TPanel(tela.Components[i]).Top := TPanel(tela.Components[i]).Top +3;


               if ((TPanel(tela.Components[i]).Height) <= 91) and ((TPanel(tela.Components[i]).Width) <= 75) then
                 begin

                 TPanel(tela.Components[i]).Height := TPanel(tela.Components[i]).Height+2;
                 TPanel(tela.Components[i]).Width := TPanel(tela.Components[i]).Width +2;
                  //Sleep(100);
                 end;


                  if verificaColisao(carro, TPanel(tela.Components[i])) or verificaColisao(carroDir, TPanel(tela.Components[i]))  or VerificaColisao(carroEsq, TPanel(tela.Components[i]))then
                   begin
                     bateu := true;
                     ExibeBatida;
                   end;


               //Se sair da tela volta pro topo

               if ((TPanel(tela.Components[i])).Top > tela.Height)  then
                begin
                  count := count+1;
                if(count<=20) then
                begin

                  Tpanel(tela.Components[i]).Top := 0;
                  Tpanel(tela.Components[i]).Left := Random(tela.Width-30);
                  Tpanel(tela.Components[i]).Width :=  55;
                  Tpanel(tela.Components[i]).Height := 71;

                  end
                  else
                  begin
                    //chegada.Visible := true;
                    //COLOCAR IMAGEM AQUI
                  end;
                end;






             end;
          end;



          end; //fim do for



        end;

      end;




 procedure TJogo.IncrementaN�vel(Sender: TObject);

   var i: Integer;
   begin

      if not bateu then
      begin

        tPanel(tela).Color := rgb(139,69,19);
        tPanel(painel2).Color := rgb(218,165,32);
        nivel :=2;
        {
        for i := 0 to Tela.ComponentCount-1 do
        begin
          if Tela.Components[i] is TPanel then
          begin

               tPanel(tela).Color := rgb(54,54,54);


          end;

        end;
        }

      end;
          //if nivel > 10  then TMover.Interval := 1;
          //inc(nivel);



   end;

procedure TJogo.inicializar(T: TWinControl; C: TWinControl);
   begin
      tela      := t;
      tela2     := C;
      bateu     := false;
      NumCarros := 0;
      NumCacto := 0;
      nivel     :=1;
      count     :=0;

      //CarroDoJogador

       carro  := timage.Create(tela);
       carro.Parent := tela;
       carro.Picture.LoadFromFile('D:\Documentos\S�timo Per�odo\Delphi\TRABIGORtopgear\carrinho 01 png.png');
       carro.Height := 91;
       carro.Width := 75;
       carro.Stretch := true;
       //carro.Proportional := true;
       carro.Visible := true;
       carro.Top := (tela.Height)-100;
       //carro.Left := round(tela.Width/2);
       carro.Left :=  75;


       //CarroDoJogadorDireita
       carroDir  := timage.Create(tela);
       carroDir.Parent := tela;
       carroDir.Picture.LoadFromFile('D:\Documentos\S�timo Per�odo\Delphi\TRABIGORtopgear\carrinho 02 png.png');
       carroDir.Height := 91;
       carroDir.Width := 75;
       carroDir.Stretch := true;
       //carroDir.Proportional := true;
       carroDir.Visible := false;
       carroDir.Top := (tela.Height)-100;
       carroDir.Left := round(tela.Width/2);

       //CarroDoJogadorEsquerda
       carroEsq  := timage.Create(tela);
       carroEsq.Parent := tela;
       carroEsq.Picture.LoadFromFile('D:\Documentos\S�timo Per�odo\Delphi\TRABIGORtopgear\carrinho 02 invertido png.png');
       carroEsq.Height := 91;
       carroEsq.Width := 75;
       carroEsq.Stretch := true;
       //carroEsq.Proportional := true;
       carroEsq.Visible := false;
       carroEsq.Top := (tela.Height)-100;
       carroEsq.Left := round(tela.Width/2);


       //batida

       Batida  := timage.Create(tela);
       Batida.Parent := tela;
       Batida.Picture.LoadFromFile('D:\Documentos\S�timo Per�odo\Delphi\TRABIGORtopgear\pow.png');
       Batida.Height := 100;
       Batida.Width := 100;
       Batida.Stretch := true;
       Batida.Proportional := true;
       Batida.Visible := false;


       TCriador          := TTimer.Create(tela);
       TCriador.Interval := 1000;
//     TCriador.OnTimer  := CriaInimigo;
       TCriador.Enabled  := true;

       TMover           := TTimer.Create(tela);
       TMover.Interval  := 2;
  //   TMover.OnTimer   := MoveInimigos;
       TMover.Enabled   := true;

       TNivel           := TTimer.Create(tela);
       TNivel.Interval  := 5000;
//     TNivel.OnTimer   := IncrementaNivel;
       TNivel.Enabled   := true;






   end;



procedure TJogo.MoveCima;
   begin
    //SEI LA MUDAR DPS
    carroEsq.Visible := false;
    carroDir.Visible := false;
    carro.Visible := true;
   end;

    {
   function TJogo.VerificaColisao(o1: TControl; o2: TControl) : boolean;
   begin


          Result := true;

            if (o1.Left+o1.Width<o2.Left) or
                (o1.Left>o2.Width+o2.Left) or
                        (o1.Top+o1.Height<o2.Top) or
                          (o1.Top> o2.Top+o2.Height)  then
                              Result := false;

   end;

    }


function TJogo.VerificaColisao(o1: TControl; o2: TControl) : boolean;
    var topo, baixo, esquerda, direita : boolean;
   begin
      topo     := false;
      baixo    := false;
      esquerda := false;
      direita  := false;

      if (O1.Top >= O2.Top) and (O1.Top <= O2.Top + O2.Height)  then
      begin
        topo := true;
      end;

      if (O1.Left >= O2.Left) and (O1.Left <= O2.Left + O2.Width) then
      begin
        esquerda := true;
      end;

      if (O1.Top + O1.Height >= O2.Top) and (O1.Top + O1.Height <= O2.Top) then
      begin
          baixo := true;
      end;

      if (O1.Left + O1.Width >= O2.Left) and ( O1.Left + O1.Width <= O2.Left) then
      begin
        direita := true;
      end;


      if (topo or baixo) and (esquerda or direita) then

        O2.Visible := false;


      verificaColisao := (topo or baixo) and (esquerda or direita);

   end;



procedure TJogo.exibeBatida;
    var tm : TMediaPlayer;
    begin
       tm := TMediaPlayer.Create(tela);
       tm.Parent := tela;
       tm.Visible := false;
       //tm.FileName :=    '';
       //tm.Open;
       //tm.Play;

       Batida.top := round(carro.top + carro.height /2) - round(Batida.Height/2);
       Batida.left := round(carro.left + carro.width /2) - round(Batida.width/2);
       carro.visible := false;
       carroEsq.Visible := false;
       carroDir.Visible := false;
       Batida.visible := true;
    end;



end.
