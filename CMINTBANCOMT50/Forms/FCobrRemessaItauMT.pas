{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Itaú               }
{   ITAÚ - IDMODELOSCNAB = 0/R                          }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit FCobrRemessaItauMT;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
TB97, TB97Ctls, TB97Tlbr, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, 
EditReg;

type
  TFrmCobrRemessaItauMT = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    pnlFundo: TPanel;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    bbtnCancelar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    CmbEspecie: TComboBox;
    CmbInstrucaoI: TComboBox;
    CmbInstrucaoII: TComboBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RgAceite: TRadioGroup;
    Label6: TLabel;
    EdtNumeEmpresa: TEdit;
    Label7: TLabel;
    EdtJuros: TEdit;
    Label8: TLabel;
    EdtMensagem: TEdit;
    Label9: TLabel;
    EdtPrazo: TEdit;
    edtNossoNumero: TEdit;
    Label10: TLabel;
    CmbCarteira: TComboBox;
    EdtNomeEmpresa: TEdit;
    Label11: TLabel;
    Label2: TLabel;
    CmbOcorrencia: TComboBox;
    EdtGravaEspecie: TEditReg;
    EdtGravaCarteira: TEditReg;
    EdtGravaInst1: TEditReg;
    EdtGravaInst2: TEditReg;
    EdtGravaMensagem: TEditReg;
    procedure bbtnSairClick(Sender: TObject);
    procedure CmbInstrucaoIChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    {Cálculo do digito verificador do nosso número gerado no arquivo de remessa}
    aMensagen: Array [0..8] of String;
    Function CalculaDac(sNossoNumero: String): String;
  public

  end;

var
  FrmCobrRemessaItauMT: TFrmCobrRemessaItauMT;

implementation

Uses uCmDialogs, uString, uIntBancoManager;

{$R *.DFM}

procedure TFrmCobrRemessaItauMT.bbtnSairClick(Sender: TObject);
begin
     Close;
end;

procedure TFrmCobrRemessaItauMT.CmbInstrucaoIChange(Sender: TObject);
begin
   If (CmbInstrucaoI.itemIndex = CmbInstrucaoII.itemIndex) AND
      ((Sender as TComboBox).itemIndex <> -1) Then
      Begin
           MsgAviso('As instruções de cobrança tem de ser diferentes','Atenção');
           (Sender as TComboBox).itemIndex := -1;
           Exit;
      end;
   EdtMensagem.Text := '';

   If (Sender as TComboBox).ItemIndex in [17,16] Then
   Begin
        If (Sender as TComboBox).itemIndex = 16 Then
           EdtMensagem.MaxLength := 30
        Else
            EdtMensagem.MaxLength := 40;
        EdtMensagem.Enabled := True
   End
   Else
       EdtMensagem.Enabled := False;
end;

procedure TFrmCobrRemessaItauMT.bbtnConfirmarClick(Sender: TObject);
Var ArquivoRemessa: TextFile;
    iNumSeq, Prazo, Y, iTotMensagens, iContMessage: Integer;
    sTipoInsc, sAceite, sCodInscEmpresa, sInstrucao1,sInstrucao2: String;
    Juros,rNossoNumero: Real;
    DadosBancarios : String;
begin
  If Trim(CmbCarteira.Text) = ''  Then
  Begin
     MsgAviso('Favor indicar a carteira para cobrança','Atenção');
     CmbCarteira.SetFocus;
     Exit;
  End;

  If Trim(CmbEspecie.Text) = ''  Then
  Begin
     MsgAviso('Favor indicar a espécie da cobrança','Atenção');
     CmbEspecie.SetFocus;
     Exit;
  End;

  Try
       If Trim(CmbInstrucaoI.Text) = '' Then
          sInstrucao1 := '00'
       Else
          sInstrucao1 := Copy(CmbInstrucaoI.Items[CmbInstrucaoI.ItemIndex],1,2);

       If Trim(CmbInstrucaoII.Text) = '' Then
          sInstrucao2 := '00'
       Else
          sInstrucao2 := Copy(CmbInstrucaoII.Items[CmbInstrucaoII.ItemIndex],1,2);

       IntBancoManager.mensagem1:='';      //maria 08/2000
       IntBancoManager.mensagem2:='';
       IntBancoManager.mensagem3:='';
       If (Trim(CmbInstrucaoI.Text) <> '')
       and (Trim(CmbInstrucaoI.Text) <> '93 MENSAGEM NOS BLOQUETOS COM 30 POSIÇÕES')
       and (Trim(CmbInstrucaoI.Text) <> '94 MENSAGEM NOS BLOQUETOS COM 40 POSIÇÕES') Then
       begin
          if Trim(CmbInstrucaoI.Text)  <> trim(CmbInstrucaoI.Items[CmbInstrucaoI.ItemIndex])  then
             IntBancoManager.mensagem1:=Copy(Trim(CmbInstrucaoI.Text),1,40)
          else
             IntBancoManager.mensagem1:=  Copy(CmbInstrucaoI.Items[CmbInstrucaoI.ItemIndex],4,40);
       end;


       If (Trim(CmbInstrucaoII.Text) <> '')
       and (Trim(CmbInstrucaoII.Text) <> '93 MENSAGEM NOS BLOQUETOS COM 30 POSIÇÕES')
       and (Trim(CmbInstrucaoII.Text) <> '94 MENSAGEM NOS BLOQUETOS COM 40 POSIÇÕES') Then
       begin
          if Trim(CmbInstrucaoII.Text)  <> trim(CmbInstrucaoII.Items[CmbInstrucaoII.ItemIndex])  then
             IntBancoManager.mensagem2:=Copy(Trim(CmbInstrucaoII.Text),1,40)
          else
             IntBancoManager.mensagem2:=  Copy(CmbInstrucaoII.Items[CmbInstrucaoII.ItemIndex],4,40);
       end;
       If Trim(EdtMensagem.Text) <> '' Then
          IntBancoManager.mensagem3:=copy(EdtMensagem.Text,1,40);

       iNumSeq := 1;
       sTipoInsc := '02';
       Case RgAceite.ItemIndex of
            0: sAceite := 'A';
            1: sAceite := 'N';
       End;

       Try
        // Correção do Valor de Juros, antes não testava se o mesmo estava preechido ou não
        // Correção dia 02/09/98
        If Trim(EdtJuros.Text) = '' Then
           Juros := 0
        Else
           Juros := StrToFloat(EdtJuros.Text);

       Except
        Juros := 0;
       End;

       Prazo := StrToIntDef(EdtPrazo.Text,0);

       //Opçao de gerar nosso número ou Reimprimir o Arquivo
       If (StrToFloat(Copy(edtNossoNumero.Text,1,8)) <> 0) Then
          rNossoNumero := StrToFloat(Copy(edtNossoNumero.Text,1,8))
       Else
          rNossoNumero := 0;

       IntBancoManager.CdsTexto.Open;

       If IntBancoManager.CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
          sCodInscEmpresa := '01'
       Else
          sCodInscEmpresa := '02';

       if not IntBancoManager.Naogerararquivo then
       begin
            AssignFile(ArquivoRemessa, IntBancoManager.sNomeArquivo);
            ReWrite(ArquivoRemessa);

            //Header
            //DadosBancarios := RetiraEspacos(MascaraAlfa(COPY(EdtNumeEmpresa.Text,1,4)+'00'+COPY(EdtNumeEmpresa.Text,5,12)));

            DadosBancarios := ZE(RetiraEspacos(MascaraAlfa(EdtNumeEmpresa.Text)),12);
            WriteLn(ArquivoRemessa,Concat('0',
                                          '1',
                                          'REMESSA',
                                          '01',
                                          AE('COBRANCA',15),
                                          DadosBancarios ,
                                          SPC(8),
                                          AE(EdtNomeEmpresa.Text,30),
                                          '341',
                                          AE('ITAú',15),
                                          REMOVEBARRAS(DateToStr(Date)),
                                          SPC(294),ZD(IntToStr(iNumSeq),6)));
            Inc(iNumSeq);
            //Transação
            IntBancoManager.CdsTexto.First;
            While Not IntBancoManager.CdsTexto.Eof Do
            Begin
               If IntBancoManager.CdsTexto.FieldByName('TIPO').AsString = 'F' Then
                   sTipoInsc := '01'
                Else
                   sTipoInsc := '02';

                if rNossoNumero = 0 Then
                   IntBancoManager.sNossoNumero := ZD('0',8)
                Else
                   IntBancoManager.sNossoNumero := Zd(FloatToStr(rNossoNumero),8);

                WriteLn(ArquivoRemessa,
                        Concat('1', {codigo de registro}
                               sCodInscEmpresa,{codigo de inscricao}
                               IntBancoManager.CdsEmpresa.FieldByName('NUMDOCUMENTO').AsString, {numero de inscricao}
                                DadosBancarios, {codigo da empresa}
                               Spc(8),  {brancos}
                               AE(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString + IntBancoManager.IdentificaOrigem + IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,25), {ident titulo empresa}
                               IntBancoManager.sNossoNumero, {nosso numero}
                               ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOROM').AsFloat,5),13), {qtde moeda}
                               Copy(CmbCarteira.Items[CmbCarteira.ItemIndex],4,3), {nª carteira}
                               Spc(21), {brancos}
                               Copy(CmbCarteira.Items[CmbCarteira.ItemIndex],1,1), {codigo carteira}
                               '01', {Copy(CmbOcorrencia.Items[CmbOcorrencia.ItemIndex],1,2) codigo ocorrência}
                               AE(Trim(IntBancoManager.CdsTexto.FieldByName('NODOCUMENTO').AsString) +'/'+ Trim(IntBancoManager.CdsTexto.FieldByName('ComplDocumento').AsString),10), {nº do documento}
                               REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAVENCTO').AsString), {data venciento}
                               ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat,2),13), {valor}
                               '341',  {codigo do banco}
                               Spc(5), {brancos}
                               Copy(CmbEspecie.Items[CmbEspecie.ItemIndex],1,2), {especie do titulo}
                               SAceite, {aceite}
                               REMOVEBARRAS(DateToStr(Date)), {data emissao}
                               sInstrucao1, {instrucao I}
                               sInstrucao2, {instrucao II}
                               //-------------------------------------------------
                               ZD(RemoveVirgulas(Juros*IntBancoManager.CdsTexto.FieldByName('VALOR').AsFloat/100,2),13), {juros por dia}
                               REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATALIMITE').AsString), {Data limite desconto}
                               ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13), {valor do desconto}
                               ZD(RemoveVirgulas(IntBancoManager.CdsTexto.FieldByName('VALOROM').AsFloat,5),13), {valor outra moeda}
                               ZD('0',13), {valor abatimento}
                               //-------------------------------------------------
                               sTipoInsc, {tipo inscricao do sacado}
                               AE(IntBancoManager.CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14), {nº inscricao do sacao}
                               AE(IntBancoManager.CdsTexto.FieldByName('NOME').AsString,30),
                               Spc(10), {brancos}
                               AE(Copy(IntBancoManager.CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                       IntBancoManager.CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                       IntBancoManager.CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40),
                               AE(IntBancoManager.CdsTexto.FieldByName('BAIRRO').AsString,12),
                               ZE(IntBancoManager.CdsTexto.FieldByName('CEP').AsString,8),
                               AE(IntBancoManager.CdsTexto.FieldByName('CIDADE').AsString,15),
                               AE(IntBancoManager.CdsTexto.FieldByName('CODESTADO').AsString,2),
                               AE(EdtMensagem.Text,30), {Mesagem opcional}
                               SPC(4),
                               REMOVEBARRAS(IntBancoManager.CdsTexto.FieldByName('DATAPROGRAMADA').AsString),
                               ZD(IntToStr(Prazo),2),
                               ' ',
                               Zd(IntToStr(iNumSeq),6)));
                Inc(iNumSeq);

                If IntBancoManager.MontaSqlTestaMensagem(IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) Then
                Begin
                    iTotMensagens := 0;

                    For Y:=0 To 8 Do
                        aMensagen[y] := '';

                    iContMessage := 0;

                    IntBancoManager.CdsMensagens.First;
                    While not IntBancoManager.CdsMensagens.Eof Do
                    Begin
                      aMensagen[iContMessage] := IntBancoManager.CdsMensagens.Fields[0].AsString;
                      Inc(iContMessage);
                      Inc(iTotMensagens);

                      If iContMessage > 8 Then break;

                      IntBancoManager.CdsMensagens.Next;
                    End;

                    //Monta Mensagens Layout 2
                    WriteLn(ArquivoRemessa,
                               Concat('6', {codigo de registro}
                               '2', {codigo do Layout}
                               AE(aMensagen[0],69),
                               AE(aMensagen[1],69),
                               AE(aMensagen[2],69),
                               AE(aMensagen[3],69),
                               AE(aMensagen[4],69),
                               Spc(47),
                               Zd(IntToStr(iNumSeq),6)));
                    Inc(iNumSeq);


                    If iTotMensagens > 5 Then
                    Begin
                      //Monta Mensagens Layout 3
                      WriteLn(ArquivoRemessa,
                               Concat('6', {codigo de registro}
                               '3', {codigo do Layout}
                               AE(aMensagen[5],69),
                               AE(aMensagen[6],69),
                               AE(aMensagen[7],69),
                               AE(aMensagen[8],69),
                               Spc(116),
                               Zd(IntToStr(iNumSeq),6)));
                       Inc(iNumSeq);
                    End;
                End;

                IntBancoManager.CdsMensagens.Close;

                //Opçao gerar nosso número ou Reimprimir o Arquivo
                If (StrToFloat(Copy(edtNossoNumero.Text,1,8)) <> 0) Then
                Begin
                   if not IntBancoManager.AtualizaDoc('1','S',CalculaDac(IntBancoManager.sNossoNumero),DateToStr(Date),IntBancoManager.CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
                      raise Exception.Create(IntBancoManager.MessageInfo);
                   rNossoNumero := rNossoNumero + 1;
                End;

                If (Not IntBancoManager.GeraNossoNumero) And (StrToFloat(Copy(edtNossoNumero.Text,1,8)) = 0) Then
                begin
                   if not IntBancoManager.AtualizaDoc('1','S','',DateToStr(Date),IntBancoManager.CodArquivoRemessa,IntBancoManager.CdsTexto.FieldByName('CodDocumento').AsString,IntBancoManager.CdsTexto.FieldByName('FLGGRUPO').AsString) then
                      raise Exception.Create(IntBancoManager.MessageInfo);
                end;

                IntBancoManager.CdsTexto.Next;
            End;

            IntBancoManager.CdsMensagens.Close;

            WriteLn(ArquivoRemessa,Concat('9',SPC(393),Zd(IntToStr(iNumSeq),6)));

            CloseFile(ArquivoRemessa);

            IntBancoManager.UltNossoNumero := FloatToStr(rNossoNumero);
            IntBancoManager.UltCodArquivoGerado := IntBancoManager.CodArquivoRemessa;
            IntBancoManager.MostraArquivo;
       end;
       //Grava no Register a tela anterior
       EdtGravaCarteira.Text := IntTostr(CmbCarteira.ItemIndex);
       EdtGravaEspecie.Text := IntTostr(CmbEspecie.ItemIndex);
       EdtGravaInst1.Text := IntTostr(CmbInstrucaoI.ItemIndex);
       EdtGravaInst2.Text := IntTostr(CmbInstrucaoII.ItemIndex);
       EdtGravaMensagem.Text := EdtMensagem.Text;
  Except
     On E:Exception Do
     Begin
       IntBancoManager.CdsMensagens.Close;
       MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message,'Atenção');
       if not IntBancoManager.NaoGerarArquivo then CloseFile(ArquivoRemessa);
       Abort;
     End;
  End;

  ModalResult := MrOk;
end;

procedure TFrmCobrRemessaItauMT.bbtnCancelarClick(Sender: TObject);
begin
   CmbCarteira.ItemIndex := -1;
   CmbEspecie.ItemIndex := -1;
   CmbInstrucaoI.ItemIndex := -1;
   CmbInstrucaoII.ItemIndex := -1;
   EdtMensagem.Text := '';
end;

procedure TFrmCobrRemessaItauMT.FormCreate(Sender: TObject);
begin
  EdtNomeEmpresa.Text := IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString;
  EdtNumeEmpresa.Text := IntBancoManager.NumeEmpresaBanco;
  EdtNossoNumero.Text := ZD(Copy(IntBancoManager.NossoNumero,1,8),8);
  EdtPrazo.Text       := IntBancoManager.DiasProtesto;
  EdtJuros.Text       := IntBancoManager.ValorJuros;

  If EdtGravaCarteira.Text = '' Then EdtGravaCarteira.Text := '-1';
  If EdtGravaEspecie.Text = ''  Then EdtGravaEspecie.Text := '-1';
  If EdtGravaInst1.Text = '' Then EdtGravaInst1.Text := '-1';
  If EdtGravaInst2.Text = ''  Then EdtGravaInst2.Text := '-1';

  CmbCarteira.ItemIndex := StrToIntDef(EdtGravaCarteira.Text, -1);
  CmbEspecie.ItemIndex := StrToIntDef(EdtGravaEspecie.Text, -1);
  CmbInstrucaoI.ItemIndex := StrToIntDef(EdtGravaInst1.Text, -1);
  CmbInstrucaoII.ItemIndex := StrToIntDef(EdtGravaInst2.Text, -1);

  EdtMensagem.Text := EdtGravaMensagem.Text;

end;

Function TFrmCobrRemessaItauMT.CalculaDac(sNossoNumero: String): String;

Var
  sAgencia,sConta,sSubCarteira,sNumero,sAuxResult: String;
  iPosicao, iBase, x, iDividendo, iDigito: Integer;
Begin

     sAgencia := ZD(IntBancoManager.CdsTexto.fieldbyname('NUMAGENCIA').asstring,4) ;
     sConta   := ZD(IntBancoManager.CdsTexto.fieldbyname('NUMCONTA').asstring,5) ;
     sSubCarteira := Copy(CmbCarteira.Items[CmbCarteira.ItemIndex],4,3);
     sNumero     := sAgencia + sConta + sSubCarteira + sNossoNumero;

     iPosicao := Length(sNumero) + 1;
     iBase := 2;
     iDividendo := 0;

     For X:=1 to Length(sNumero) do
     begin
         sAuxResult := IntToStr((StrToInt(sNumero[iPosicao - x]) * ibase));
         If  Length(sAuxResult) > 1 Then
            iDividendo := iDividendo + StrToInt(sAuxResult[1]) + strToInt(sAuxResult[2])
         Else
            iDividendo := iDividendo + StrToInt(sAuxResult[1]);
         Dec(iBase);
         If iBase = 0 Then iBase := 2;
     end;

     iDigito := 10 - (iDividendo Mod 10);

     If iDigito = 10 Then
        iDigito := 0;
        
     Result := sNossoNumero + IntToStr(iDigito);   


end;

end.
