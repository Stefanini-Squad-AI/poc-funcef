{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCheqBloqCM: Classe com métodos de configurqação    }
{   e impressão de cheques e boletos configuráveis      }
{   pelo usuário                                        } 
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit UCheqBloqMT;

interface

Uses
  SysUtils, Forms, Windows, Graphics, Classes, Dialogs, uSistema, uGImp, uString,
  DbClient;

Type
   TCheqBloqCM = Class
   private
         _ContChqBloqueto      :Integer;
         FNumCheque            :Integer;
         FNumlinha             :Integer;
         FNumCobr              :Integer;
         IncPrimeiroDoc        :Integer;
         FIsImpGenerica        :Boolean;
         fFonteCondensada      :Boolean;
         FLinhasImpressao      :TStringList;
         _CdsConfig            :TClientDataSet;
         GImp                  :TGimp;
         fIdTemplCheque        :Integer;
         fCompAno              :Integer;
         fNumBloqChqSaltoLinha :Integer;
         fNumLinhasSalto       :Integer;
         fValor                :String;
         fExtenso              :String;
         fPortador             :String;
         fLocal                :String;
         fLocalDiferido        :String;
         FImpressoraDefault    :String;
         fData                 :TDateTime;
         fDataDiferido         :TDateTime;
         iNumCarCheques        :Integer;
   public
         {Impressora padrão a ser utilizada}
         property ImpressoraDefault    :String       read FImpressoraDefault    write FImpressoraDefault;
         {Número da linha corrente a ser impressa}
         property Numlinha             :Integer      read FNumlinha             write FNumlinha;
         {Número do cheque corrente a ser impresso}
         property NumCheque            :Integer      read FNumCheque            write FNumCheque;
         {Número do boleto corrente a ser impresso}
         property NumCobr              :Integer      read FNumCobr              write FNumCobr;
         {Verifica se a impressora padrão é um impressora genérica}
         property IsImpGenerica        :Boolean      read FIsImpGenerica        write FIsImpGenerica;
         {Controla a impressão de fontes Default ou Condensada}
         property FonteCondensada      :Boolean      read fFonteCondensada      write fFonteCondensada;
         {String List com as linhas geradas para a impressão}
         property LinhasImpressao      :TStringList  read FLinhasImpressao      write FLinhasImpressao;
         {Identificador do Modelo do Cheque}
         property IdTemplCheque        :Integer      read fIdTemplCheque        write fIdTemplCheque;
         {Qtde de Dígitos do Ano a ser impresso no cheque}
         property CompAno              :Integer      read fCompAno              write fCompAno;
         {Exetenso do Valor a ser impresso no cheque}
         property Valor                :String       read fValor                write fValor;
         {Exetenso do Valor a ser impresso no cheque}
         property Extenso              :String       read fExtenso              write fExtenso;
         {Portador do cheque a ser impresso}
         property Portador             :String       read fPortador             write fPortador;
         {Local de emissão do cheque a ser impresso}
         property Local                :String       read fLocal                write fLocal;
         {Local de emissão do cheque a ser impresso para pagamento de cheques diferidos;}
         property LocalDiferido        :String       read fLocalDiferido        write fLocalDiferido;
         {Data de emissão do cheque a ser impresso}
         property Data                 :TDateTime    read fData                 write fData;
         {Data de emissão do cheque a ser impresso para pagamento de cheques diferidos}
         property DataDiferido         :TDateTime    read fDataDiferido         write fDataDiferido;
         {Quantidade de cheques a serem impressos ates de um salto de linha}
         property NumBloqChqSaltoLinha :Integer      read fNumBloqChqSaltoLinha write fNumBloqChqSaltoLinha;
         {numeros de linhas a serem 'saltadas' antes da impressão do próximo conjunto de cheques}
         property NumLinhasSalto       :Integer      read fNumLinhasSalto       write fNumLinhasSalto;
         {Construtor da classe}
         Constructor Create(sImpressoreaDefault:String; IdImpressora: Integer);
         {destrutor da classe}
         Destructor Destroy; Override;
         {Gera o cheque a partir das propriedades da classe}
         function   GeraCheque:Boolean;
         {Gera a cobrança a partir dos parâmetros passados}
         function   GeraCobr(PortadorForma : Integer; LocalPgto, Vencimento, DataDoc, NumeroDoc,
                              EspecieDoc,Aceite, DataProcess, NossoNumero, Carteira, Especie,
                              Quantidade, Valor, ValorDoc, DataProgramada, DataLimite, ValorDesconto,
                              Mensagem1, Mensagem2, Mensagem3, Mensagem4, Mensagem5,
                              Nome, CPF_CGC, Endereco, Numero, Cplto, Bairro, Cidade, UF,
                              CEP: String): Boolean;
         {inicializa impressora selecionada para emissão de documentos}
         function    InicializaImpressora(sMensagem: String):Boolean;
         {formata valor do cheque com * de acordo com o tamanho passado}
         function    CompletaValorCheque(sValor:string; iTamanho:Integer):String;
         {formata extensso do cheque com * de acordo com o tamanho passado}
         function    CompletaExtenso(sExtenso:string; iTamanho:Integer):String;
         {quebra a linha do extendo do cheque de acordo com o tamanho passado}
         procedure   ArrumaExtensoCheque(sExtenso:String;iLength: Integer;var sExtenso1,sExtenso2:String);
         {retorna o nome do mês para emisão de cheque}
         function    GetMonthName(iMes:Integer):String;
         {imprime os documento ( cheque ou boletos ) gerados}
         function    Imprime :Boolean;
end;

Type
   TBufferImpressora = record
   TamanhoBuffer: Word;
   Buffer: array [0..255] of Char;

End;

implementation

Uses uCtrlPadroes;

Constructor TCheqBloqCM.Create(sImpressoreaDefault:String;IdImpressora: Integer);
Begin
   inherited Create;
   _CdsConfig := TClientDataSet.Create(Application);

   FNumlinha               := -1;
   FNumCheque              :=  0;
   FNumCobr                :=  0;
   FIsImpGenerica          := False;
   FLinhasImpressao        := TStringList.Create;
   FImpressoraDefault      := sImpressoreaDefault;
   FonteCondensada         := False;
   _ContChqBloqueto        := 0;
   fNumBloqChqSaltoLinha   := 0;
   fNumLinhasSalto         := 0;
   GImp                    := TGImp.Create(Application);
   GImp.DataBaseName       := 'BaseDados';
   GImp.Porta_Impressora   := FImpressoraDefault;
   GImp.Modelo             := idImpressora;
   GImp.MostraPrinterSetup := True;
End;

Destructor TCheqBloqCM.Destroy;
Begin
  FLinhasImpressao.Free;
  GImp.Free;
  _CdsConfig.Free;
  Inherited Destroy;
End;

function TCheqBloqCM.Imprime:Boolean;
Var
  X: Integer;
Begin
  Result := True;
  Try
     If LinhasImpressao.Count <> 0 Then
     Begin
       Result := GImp.Inicializar;
       If  Result Then
       Begin
          GImp.EjetarPagina           := True;
          GImp.SaltodeLinhaCondensado := True;
          GImp.Condensado             := fFonteCondensada;
          GImp.TipoFonte              := TfNormal;

          For X:= 1 To fLinhasImpressao.Count - 1 Do
              GImp.ImprimirTexto(LinhasImpressao[x]);

          GImp.Finalizar;
       End;

       //LinhasImpressao.SaveToFile(Sistema.TempDir + 'CheqBloq.Txt');
     End;
  Finally
     fLinhasImpressao.Clear;
     _CdsConfig.Close;
  End;
End;

Function TCheqBloqCM.InicializaImpressora(sMensagem: String): Boolean;
Var
   sChqBloqAtual :String;
Begin
   FNumlinha      := -1;
   FNumCheque     :=  0;
   FNumCobr       :=  0;
   IncPrimeiroDoc := 0;
   IsImpGenerica  := (Pos('TEXT',UpperCase(ImpressoraDefault)) <> 0);
   Result         := True;

   sChqBloqAtual  := '0';
   If (fNumBloqChqSaltoLinha <> 0) And(NumLinhasSalto <> 0) Then
      Result := InputQuery('Configuração de Impressão','Indique o número de impressos para o salto',sChqBloqAtual);

   Try
      _ContChqBloqueto := fNumBloqChqSaltoLinha - StrToInt(Trim(sChqBloqAtual));
      If _ContChqBloqueto < 0 Then _ContChqBloqueto := 0;
   Except
      _ContChqBloqueto := 0;
   End;
End;

Function TCheqBloqCM.GeraCheque: Boolean;
Var
  Conteudo      :Array [0..12] of String;
  Dia,Mes,Ano   :Word;
  SAno, sLinha  :String;
  iOldNumLinha  :Integer;
  iContSalto    :Integer;
Begin
      Result := False;
      //Prepara Query ordenada, somente com os campos preenchidos nas posições de linha e coluna
      If NumLinha = -1 Then
      Begin
           _CdsConfig.Data := Padroes.GetDataPacket(' SELECT C.CAMPOCHEQUE ,  C.LINHACHEQUE , C.COLUNACHEQUE ' +
                                                    'FROM ' + sistema.PrefixoServidor + 'CONFIGCHEQUE C ' +
                                                    'WHERE ( C.IDTEMPLCHEQUE = ' + IntToStr(fIdTemplCheque) + ')  AND ' +
                                                    '( C.LINHACHEQUE   > 0 )  AND ' +
                                                    '( C.COLUNACHEQUE  > 0 ) ' +
                                                    'ORDER BY C.LINHACHEQUE , C.COLUNACHEQUE');
           _CdsConfig.First;

           NumLinha := 0;

           While (LinhasImpressao.Count) < (NumLinha + _CdsConfig.Fields[1].Value) Do
                  LinhasImpressao.Add('  ');
      end;

      IF _CdsConfig.IsEmpty Then
      Begin
          Application.MessageBox('Sem Configuração Para este Cheque!','Aviso',Mb_IconInformation);
          Exit;
      end;

      Conteudo[0] := fValor;

      If fFonteCondensada Then
         iNumCarCheques := 90
      Else
         iNumCarCheques := 55;
         
      ArrumaExtensoCheque(Trim(fExtenso),iNumCarCheques,Conteudo[1],Conteudo[2]);

      Conteudo[3] := Trim(fPortador);
      Conteudo[4] := Trim(fLocal);
      DecodeDate(fData,Ano,Mes,Dia);
      Conteudo[5] := IntToStr(Dia);
      Conteudo[6] := GetMonthName(Mes);
      SAno        := IntToStr(Ano);
      Conteudo[7] := Copy(SAno,Length(IntToStr(Ano)) - fCompAno + 1,fCompAno);

      If (fLocalDiferido <> '') Then
      Begin
         Conteudo[8]  := Trim(fLocalDiferido);
         DecodeDate(fDataDiferido,Ano,Mes,Dia);
         Conteudo[9]  := IntToStr(Dia);
         Conteudo[10] := GetMonthName(Mes);
         SAno         := IntToStr(Ano);
         Conteudo[11] := Copy(SAno,Length(IntToStr(Ano)) - fCompAno + 1,fCompAno);
      End
      Else
      Begin
         Conteudo[8]  := '';
         Conteudo[9]  := '';
         Conteudo[10] := '';
         Conteudo[11] := '';
      End;

      Conteudo[12] := '-';

      _CdsConfig.First;
      sLinha := '';
      iOldNumLinha := (NumLinha + _CdsConfig.Fields[1].Value);

      // Varre o Cds que contém a configuração do cheque
      //e monta o modo de impressão para a StringList LinhasImpressao
      //que vai ser impressa diretamente.
      While Not _CdsConfig.Eof Do
      Begin
         // Verifica se a linha de configuração é a mesma que a anterior
         If (NumLinha + _CdsConfig.Fields[1].Value) = iOldNumLinha Then
            sLinha := sLinha + Espaco('',Abs(_CdsConfig.Fields[2].AsInteger - Length(sLinha))) + Conteudo[_CdsConfig.Fields[0].AsInteger]
         Else
         // Se não for, adiciona o conteudo já montado na variável sLinha
         //para a StringList de impressão e pega os dados do registro corrente
         Begin
            LinhasImpressao.Add(sLinha);
            While (LinhasImpressao.Count) <= (NumLinha + _CdsConfig.Fields[1].Value) Do
                  LinhasImpressao.Add('  ');

            sLinha := Espaco('',_CdsConfig.Fields[2].AsInteger) + Conteudo[_CdsConfig.Fields[0].AsInteger];

          End;

          iOldNumLinha := (NumLinha + _CdsConfig.Fields[1].Value);
          _CdsConfig.Next;
      end;

      // Rodolpho da Silva - P: 25538 14/06/2007
      // Se existir dados na variável, incluir na linha de impressão
      if trim(sLinha) <> '' then
         LinhasImpressao.Add(sLinha);


      inc(FNumCheque);

      Inc(_ContChqBloqueto);

      If (_ContChqBloqueto >= fNumBloqChqSaltoLinha) And (fNumLinhasSalto > 0) Then
      Begin
         For iContSalto := 1 To fNumLinhasSalto Do  LinhasImpressao.Add(' ');
         _ContChqBloqueto := 0;
         NumLinha := NumLinha + fNumLinhasSalto;
      End;

      NumLinha := NumLinha + _CdsConfig.Fields[1].Value;

      If IncPrimeiroDoc = 0 Then IncPrimeiroDoc := 3;

      Result := True;
end;

function TCheqBloqCM.GeraCobr(PortadorForma : Integer; LocalPgto, Vencimento, DataDoc, NumeroDoc,
                   EspecieDoc,Aceite, DataProcess, NossoNumero, Carteira, Especie,
                   Quantidade, Valor, ValorDoc, DataProgramada, DataLimite, ValorDesconto,
                   Mensagem1, Mensagem2, Mensagem3, Mensagem4, Mensagem5,
                   Nome, CPF_CGC, Endereco, Numero, Cplto, Bairro, Cidade, UF,
                   CEP: String): Boolean;
Var
  Conteudo       :Array [0..24] of String;
  sLinha         :String;
  iOldNumLinha   :Integer;
  iContSalto     :Integer;
Begin
      Result := False;

      If NumLinha = -1 Then
      Begin
           _CdsConfig.Data := Padroes.GetDataPacket(' SELECT C.CAMPOBLOQUETO ,  C.LINHABLOQUETO , C.COLUNABLOQUETO ' +
                                                    ' FROM CONFIGBLOQUETE C ' +
                                                    ' WHERE ( C.CODBLOQCHE = '+ IntToStr(PortadorForma) +')  AND ' +
                                                    '( C.LINHABLOQUETO   > 0 )  AND ' +
                                                    '( C.COLUNABLOQUETO  > 0 ) ' +
                                                    ' ORDER BY C.LINHABLOQUETO , C.COLUNABLOQUETO');
           _CdsConfig.First;

           NumLinha := 0;

           While (LinhasImpressao.Count) < (NumLinha + _CdsConfig.Fields[1].Value) Do
                  LinhasImpressao.Add('  ');
      end;

      IF _CdsConfig.IsEmpty Then
      Begin
          Application.MessageBox('Sem Configuração Para este Banco!','Aviso',Mb_IconInformation);
          Exit;
      end;

      Conteudo[0] := Trim(LocalPgto);
      Conteudo[1] := Vencimento;
      Conteudo[2] := DataDoc;
      Conteudo[3] := Trim(NumeroDoc);
      Conteudo[4] := Trim(EspecieDoc);
      Conteudo[5] := Trim(Aceite);
      Conteudo[6] := DataProcess;
      Conteudo[7] := Trim(NossoNumero);
      Conteudo[8] := Trim(Carteira);
      Conteudo[9] := Trim(Especie);
      Conteudo[10] := Quantidade;
      Conteudo[11] := Valor;
      Conteudo[12] := ValorDoc;

      If Mensagem1 <> '' Then
         Conteudo[13] := 'Não Receber após ' + DataProgramada;

      If Mensagem2 <> '' Then
         Conteudo[14] := 'Até ' + DataLimite + ' ' + ValorDesconto + '% De Desconto';

      Conteudo[15] := Trim(Mensagem1);
      Conteudo[16] := Trim(Mensagem2);
      Conteudo[17] := Trim(Mensagem3);
      Conteudo[18] := Trim(Mensagem4);
      Conteudo[19] := Trim(Mensagem5);
      Conteudo[20] := Trim(Nome);
      Conteudo[21] := 'CGC\CPF: ' + CPF_CGC;
      Conteudo[22] := Trim(Endereco) + ' ' + Trim(Numero) + ' ' + Trim(Cplto);
      Conteudo[23] := Trim(Bairro) + ' ' + Trim(Cidade) + ' ' + Trim(UF) + ' CEP:' + Cep;
      Conteudo[24] := '-';

      _CdsConfig.First;
      sLinha := '';
      iOldNumLinha := (NumLinha + _CdsConfig.Fields[1].Value);
      While Not _CdsConfig.Eof Do
      Begin
        If (NumLinha + _CdsConfig.Fields[1].Value) = iOldNumLinha Then
           sLinha := sLinha + Espaco('',Abs(_CdsConfig.Fields[2].AsInteger - Length(sLinha))) + Conteudo[_CdsConfig.Fields[0].AsInteger]
        Else
        Begin
           LinhasImpressao.Add(sLinha);
           While (LinhasImpressao.Count) <= (NumLinha + _CdsConfig.Fields[1].Value) Do
                 LinhasImpressao.Add('  ');

           sLinha := Espaco('',_CdsConfig.Fields[2].AsInteger) + Conteudo[_CdsConfig.Fields[0].AsInteger];
        End;

        iOldNumLinha := (NumLinha + _CdsConfig.Fields[1].Value);
        _CdsConfig.Next;
      end;

      inc(FNumCobr);

      Inc(_ContChqBloqueto);

      If (_ContChqBloqueto >= fNumBloqChqSaltoLinha) And (fNumLinhasSalto > 0) Then
      Begin
         For iContSalto := 1 To fNumLinhasSalto Do  LinhasImpressao.Add(' ');
         _ContChqBloqueto := 0;
         NumLinha := NumLinha + fNumLinhasSalto;
      End;

      NumLinha := NumLinha + _CdsConfig.Fields[1].Value;

      If IncPrimeiroDoc = 0 Then IncPrimeiroDoc := 3;

      Result := True;
end;

Procedure TCheqBloqCM.ArrumaExtensoCheque(sExtenso:String;iLength: Integer;var sExtenso1,sExtenso2:String);
var iFator,ia,i,iNumero:Integer;
    aExtenso:Array[1..2] of String;
Begin
   iFator:=0;
   aExtenso[1]:='';
   aExtenso[2]:='';
   for ia := 1 to 2 do
   Begin
      aExtenso[ia]:=copy(sExtenso,(iFator+1),iLength);
      if length(trim(copy(sExtenso,(iFator+1),200))) <= iLength then
         Break;
      iNumero:= iNumCarCheques;
      for i := 1 to iNumCarCheques do
      begin
        if copy(aExtenso[ia],iNumero,1) = ' ' then
        Begin
           aExtenso[ia]:=copy(sExtenso,(iFator+1),iNumero);
           Break;
        end;
        iNumero:=(iNumero-1);
      end;
      iFator:=iFator+iNumero;
   end;

   sExtenso1:=CompletaExtenso(aExtenso[1],iLength);
   sExtenso2:=CompletaExtenso(aExtenso[2],iLength);
end;

Function TCheqBloqCM.CompletaExtenso(sExtenso:string; iTamanho:Integer):String;
var temp:string;
    cont, Tam:Integer;
Begin
     temp := Trim(sExtenso);

     Tam := length(temp);

     for cont:=1 to iTamanho - Tam do
         temp:=temp + '*';

     result := temp;
end;

Function TCheqBloqCM.CompletaValorCheque(sValor:string; iTamanho:Integer):String;
var temp:string;
    cont, Tam:Integer;
Begin
     temp := Trim(sValor);

     Tam := length(temp);

     for cont:=1 to iTamanho - Tam do
         temp:='*' + temp;

     result := temp;
end;

Function TCheqBloqCM.GetMonthName(iMes:Integer):String;
Var
  ExtensoMes :array [1..2,1..12] of String;
  iIdioma    :Integer;
Begin
  iIdioma := Sistema.IdiomaAtivo;
  If (iIdioma > 2) Then iIdioma := 1;

  ExtensoMes[1,1]   := 'JANEIRO';
  ExtensoMes[1,2]   := 'FEVEREIRO';
  ExtensoMes[1,3]   := 'MARÇO';
  ExtensoMes[1,4]   := 'ABRIL';
  ExtensoMes[1,5]   := 'MAIO';
  ExtensoMes[1,6]   := 'JUNHO';
  ExtensoMes[1,7]   := 'JULHO';
  ExtensoMes[1,8]   := 'AGOSTO';
  ExtensoMes[1,9]   := 'SETEMBRO';
  ExtensoMes[1,10]  := 'OUTUBRO';
  ExtensoMes[1,11]  := 'NOVEMBRO';
  ExtensoMes[1,12]  := 'DEZEMBRO';

  ExtensoMes[2,1]   := 'ENERO';
  ExtensoMes[2,2]   := 'FEBRERO';
  ExtensoMes[2,3]   := 'MARZO';
  ExtensoMes[2,4]   := 'ABRIL';
  ExtensoMes[2,5]   := 'MAYO';
  ExtensoMes[2,6]   := 'JUNIO';
  ExtensoMes[2,7]   := 'JULIO';
  ExtensoMes[2,8]   := 'AGOSTO';
  ExtensoMes[2,9]   := 'SETIEMBRE';
  ExtensoMes[2,10]  := 'OCTUBRE';
  ExtensoMes[2,11]  := 'NOVIEMBRE';
  ExtensoMes[2,12]  := 'DICIEMBRE';

  Result := ExtensoMes[iIdioma,iMes];
End;



End.



