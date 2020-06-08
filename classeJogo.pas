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

  Tnivel2     :TTimer;
  Tnivel22    :ttimer ;
  tcreate     :ttimer;
  timer1      :TTimer;
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
  count2 : Integer;
  todosOsCarrosFora : boolean;


  function VerificaColisao(o1, o2: TControl) : boolean;




  procedure exibeBatida;



  public
  painel : Tpanel;
  painel2 : Tpanel;

  //lNivel  : Tlabel;
  constructor Create(Panel1 : TPanel;   Panel2 : Tpanel);
  procedure MoveEsquerda;
  procedure MoveDireita;
  procedure MoveCima;
  procedure inicializar(T:TwinControl; C: TWinControl);
  procedure MoveCarroInimigo(Sender:TObject; Tcreate: TTimer; Tnivel2 : TTimer; tnivel22 : TTimer; timer1 : TTimer);
  procedure CriaCarroInimigo(Sender:TObject);
  procedure IncrementaNível(Sender:TObject);
  procedure CriaCacto(Sender: TObject);
  procedure CriaLinhaDeChegada();
  procedure tocaMusica;
//  procedure MoveCacto(Sender: TObject);

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
    carroEsq.Top := carro.Top; // +10;  //ESSE +10 PODE DAR ERRO NA PARTE DE COLISAO
    carroEsq.Visible := true;

    carro.Left := carro.Left-1;
    carroDir.Left :=  carroDir.Left-1;
    carroEsq.Left := carroEsq.Left-1;

    if(carroEsq.Left < 0) then
    begin
        carroEsq.Left := 10;
        carroDir.Left := 10;
        carro.Left := 10;
    end;



  end;


  procedure Tjogo.MoveDireita;

  begin
    //trocar imagem do carro para carro direita
    carro.Visible := false;
    carroEsq.Visible := false;
    carroDir.Left := carro.Left;
    carroDir.Top := carro.Top ; //+10; //ESSE +10 PODE DAR ERRO NA PARTE DE COLISAO
    carroDir.Visible:= true;

    carro.Left := carro.Left+1;
    carroDir.Left :=  carroDir.Left+1;
    carroEsq.Left := carroEsq.Left+1;

     if(carroDir.Left >340) or (carroEsq.Left >340) or (carro.Left > 340) then
    begin
        carroEsq.Left := 330;
        carroDir.Left := 330;
        carro.Left := 330;
    end;






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
          t.Picture.LoadFromFile('D:\Documentos\Sétimo Período\Delphi\TRABIGORtopgear\carrinho 01 png.png');
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


  procedure Tjogo.CriaLinhaDeChegada();
    var lc: TImage;
  begin


      if not bateu  then

        begin
          lc          := timage.Create(tela);
          lc.Parent   := tela;
          lc.Picture.LoadFromFile('D:\Documentos\Sétimo Período\Delphi\TRABIGORtopgear\finishhh.png');
          lc.Height  := 371;
          lc.Width   := 355;
          lc.Stretch := true;
          lc.Visible := true;
          lc.proportional := true;
          lc.top := 0;

         // lc.left := Random(tela.Width - 100);
          lc.Left := 40;
          lc.tag := 0;


        end;

  end;

  {
procedure MoveCacto(Sender: TObject);
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
          c.Picture.LoadFromFile('D:\Documentos\Sétimo Período\Delphi\TRABIGORtopgear\cacto.png');
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


procedure Tjogo.MoveCarroInimigo(Sender:TObject; Tcreate: TTimer; Tnivel2 : TTimer; tnivel22 : TTimer; timer1: TTimer);

   var
    i,j : Integer;


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
                       carro.Visible := false;
                       carroEsq.Visible := false;
                       carroDir.Visible := false;
                     end;


                 //Se sair da tela volta pro topo

                 if ((TPanel(tela.Components[i])).Top > tela.Height)  then
                  begin
                    count := count+1;
                    if(count<=19) then
                    begin

                    Tpanel(tela.Components[i]).Top := 0;
                    Tpanel(tela.Components[i]).Left := Random(tela.Width-30);
                    Tpanel(tela.Components[i]).Width :=  55;
                    Tpanel(tela.Components[i]).Height := 71;

                    end
                    else
                    begin
                      count2 := count2 +1
                    end;


                  end;

                  if count2 > 100 then
                  begin
                      CriaLinhaDeChegada();
                      Tnivel2.Enabled := false;
                      Tnivel22.Enabled := false;
                      Tcreate.Enabled := false;
                      Timer1.Enabled := false;

                  end;

                  //fazer um for aqui para saber se cada componente q esta na tela ja saiu
                  //das dimensoes dela
                       {
                        for j := 0 to tela.ComponentCount-1 do
                        begin
                        if(count>19) and (TPanel(tela.Components[j]).Top > tela.Height) then
                          begin
                             todosOsCarrosFora := true;
                          end
                          else
                          if(count>19) then
                          begin
                          //jogo continua break;
                           todosOsCarrosFora := false;
                             break;
                           //batida.Visible := true;
                          end;


                        end;

                         }




             end;
          end;



          end; //fim do for
           {
          if(todosOsCarrosFora = true) then
                  begin
                      //Se nao sair da tela mais entao chegou
                      //mas vai ter um erro dos ultimos estarem saindo
                      //chegada.Visible := true;
                      //COLOCAR IMAGEM AQUI
                      //desabilitar clocks
                      CriaLinhaDeChegada();
                      Tchegada.Enabled := false;
                  end;
               }

        end;//aqui fim do nao bateu

      end;



procedure TJogo.IncrementaNível(Sender: TObject);

   var i: Integer;
   begin

      if not bateu then
      begin

        tPanel(tela).Color := rgb(139,69,19);
        tPanel(painel2).Color := rgb(218,165,32);
        nivel :=2;


      end;




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
      todosOsCarrosFora := false;
       count2 := 0;
      //CarroDoJogador
       // tocaMusica;
       carro  := timage.Create(tela);
       carro.Parent := tela;
       carro.Picture.LoadFromFile('D:\Documentos\Sétimo Período\Delphi\TRABIGORtopgear\carrinho 01 png.png');
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
       carroDir.Picture.LoadFromFile('D:\Documentos\Sétimo Período\Delphi\TRABIGORtopgear\carrinho 02 png.png');
       carroDir.Height := 61;
       carroDir.Width := 75;
       carroDir.Stretch := true;
       //carroDir.Proportional := true;
       carroDir.Visible := false;
       carroDir.Top := (tela.Height)-100;
       carroDir.Left := round(tela.Width/2);

       //CarroDoJogadorEsquerda
       carroEsq  := timage.Create(tela);
       carroEsq.Parent := tela;
       carroEsq.Picture.LoadFromFile('D:\Documentos\Sétimo Período\Delphi\TRABIGORtopgear\carrinho 02 invertido png.png');
       carroEsq.Height := 61;
       carroEsq.Width := 75;
       carroEsq.Stretch := true;
       //carroEsq.Proportional := true;
       carroEsq.Visible := false;
       carroEsq.Top := (tela.Height)-100;
       carroEsq.Left := round(tela.Width/2);


       //batida

       Batida  := timage.Create(tela);
       Batida.Parent := tela;
       Batida.Picture.LoadFromFile('D:\Documentos\Sétimo Período\Delphi\TRABIGORtopgear\pow.png');
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

        tocaMusica;




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

    begin

       Batida.top := round(carro.top + carro.height /2) - round(Batida.Height/2);
       Batida.left := round(carro.left + carro.width /2) - round(Batida.width/2);
       carro.visible := false;
       carroEsq.Visible := false;
       carroDir.Visible := false;
       Batida.visible := true;
    end;




procedure TJogo.tocaMusica;
  var m : TMediaPlayer;
  begin
       m := TMediaPlayer.Create(tela);
       m.Parent := tela;
       m.Visible := false;
       m.FileName := 'D:\Documentos\Sétimo Período\Delphi\TRABIGORtopgear\Musica.Mpeg';
       m.Open;
       m.Play;
  end;



end.
