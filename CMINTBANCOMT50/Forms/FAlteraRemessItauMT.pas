{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Gera arquivo de alteração de remessa itau           }
{ - Geração do arquivo ITAÚ - IDMODELOSCNAB = 0/R       }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit FAlteraRemessItauMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, MAHlpBtn, Buttons, TB97Tlbr, TB97, EditReg;

type
  TFrmAlteraRemessItauMT = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    pnlFundo: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    CmbOcorrencia: TComboBox;
    CmbEspecie: TComboBox;
    EdtNumeEmpresa: TEdit;
    CmbCarteira: TComboBox;
    EdtNomeEmpresa: TEdit;
    EdtGravaCarteira: TEditReg;
    EdtGravaEspecie: TEditReg;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAlteraRemessItauMT: TFrmAlteraRemessItauMT;

implementation

Uses uIntBancoManager, uString, uCMDialogs;

{$R *.DFM}

procedure TFrmAlteraRemessItauMT.FormCreate(Sender: TObject);
begin
  EdtNomeEmpresa.Text := IntBancoManager.CdsEmpresa.FieldByName('RAZAOSOCIAL').AsString;
  EdtNumeEmpresa.Text := IntBancoManager.NumeEmpresaBanco;

  If EdtGravaCarteira.Text = '' Then EdtGravaCarteira.Text := '-1';
  If EdtGravaEspecie.Text = ''  Then EdtGravaEspecie.Text := '-1';

  CmbCarteira.ItemIndex := StrToIntDef(EdtGravaCarteira.Text, -1);
  CmbEspecie.ItemIndex := StrToIntDef(EdtGravaEspecie.Text, -1);
end;

procedure TFrmAlteraRemessItauMT.bbtnConfirmarClick(Sender: TObject);
Var ArquivoRemessa: TextFile;
    iNumSeq: Integer;
    sTipoInsc, sCodInscEmpresa,
    sIdentTit,sNumDoc,sDataVencto,sValor,sDataLimite,sValorDesconto,
    sDocCliente,sNomeCliente,sEndereco,sBairro,sCep,sCidade,sEstado: String;
begin
  With IntBancoManager Do
  Begin
     If Trim(CmbCarteira.Text) = ''  Then
     Begin
        MsgAviso('Favor indicar a carteira para cobrança','Atenção');
        CmbCarteira.SetFocus;
        Exit;
     End;

     If Trim(CmbEspecie.Text) = ''  Then
     Begin
        MsgAviso('Por Favor indicar a espécie da cobrança','Atenção');
        CmbEspecie.SetFocus;
        Exit;
     End;

     iNumSeq := 1;

     Try
          If CdsEmpresa.FieldByName('TIPO').AsString = 'F' Then
             sCodInscEmpresa := '01'
          Else
             sCodInscEmpresa := '02';

          AssignFile(ArquivoRemessa,sNomeArquivo);
          ReWrite(ArquivoRemessa);

          //Header
          WriteLn(ArquivoRemessa,Concat('0',
                                        '1',
                                        'REMESSA',
                                        '01',
                                        AE('COBRANCA',15),
                                        ZD(EdtNumeEmpresa.Text,12),
                                        SPC(8),
                                        AE(EdtNomeEmpresa.Text,30),
                                        '341',
                                        AE('ITAú',15),
                                        REMOVEBARRAS(DateToStr(Date)),
                                        SPC(294),
                                        ZD(IntToStr(iNumSeq),6)));
          Inc(iNumSeq);

          //Transação
          CdsTexto.First;
          While Not CdsTexto.Eof Do
          Begin
              If CdsTexto.FieldByName('TIPO').Tag =1 Then
              Begin
                If CdsTexto.FieldByName('TIPO').AsString = 'F' Then
                   sTipoInsc := '01'
                Else
                   sTipoInsc := '02';
              End
              Else
                 sTipoInsc := '00';

              sNossoNumero := ZD(CdsTexto.FieldByName('NOSSONUMERO').AsString,8);

              If CdsTexto.FieldByName('CodDocumento').Tag = 1 Then
                 sIdentTit      := AE(CdsTexto.FieldByName('CodDocumento').AsString,25)
              Else
                 sIdentTit      := Spc(25);

              If (CdsTexto.FieldByName('NODOCUMENTO').Tag    = 1) Or
                 (CdsTexto.FieldByName('ComplDocumento').Tag = 1) Then
                  sNumDoc        := AE(Trim(CdsTexto.FieldByName('NODOCUMENTO').AsString) +'/'+ Trim(CdsTexto.FieldByName('ComplDocumento').AsString),10)
              Else
                  sNumDoc        := Spc(10);

              If CdsTexto.FieldByName('DATAPROGRAMADA').Tag = 1 Then
                 sDataVencto    := REMOVEBARRAS(CdsTexto.FieldByName('DATAPROGRAMADA').AsString)
              Else
                 sDataVencto    := '000000';

              If CdsTexto.FieldByName('VALOR').Tag = 1 Then
                 sValor         := ZD(RemoveVirgulas(CdsTexto.FieldByName('VALOR').AsFloat,2),13)
              Else
                 sValor         := ZD('0',13);

              If CdsTexto.FieldByName('DATALIMITE').Tag = 1 Then
                 sDataLimite    := REMOVEBARRAS(CdsTexto.FieldByName('DATALIMITE').AsString)
              Else
                 sDataLimite    := '000000';

              If CdsTexto.FieldByName('VALORDESCONTO').Tag = 1 Then
                 sValorDesconto := ZD(RemoveVirgulas(CdsTexto.FieldByName('VALORDESCONTO').AsFloat,2),13)
              Else
                 sValorDesconto := ZD('0',13);

              If CdsTexto.FieldByName('NUMDOCUMENTO').Tag = 1 Then
                 sDocCliente    := AE(CdsTexto.FieldByName('NUMDOCUMENTO').AsString,14)
              Else
                 sDocCliente    := Spc(14);

              If CdsTexto.FieldByName('NOME').Tag = 1 Then
                 sNomeCliente   := AE(CdsTexto.FieldByName('NOME').AsString,30)
              Else
                 sNomeCliente   := Spc(30);

              If (CdsTexto.FieldByName('LOGRADOURO').Tag = 1) Or
                 (CdsTexto.FieldByName('NUMERO').Tag = 1) Or
                 (CdsTexto.FieldByName('COMPLEMENTO').Tag = 1) Then
                 sEndereco      := AE(Copy(CdsTexto.FieldByName('LOGRADOURO').AsString + ' ' +
                                          CdsTexto.FieldByName('NUMERO').AsString + ' ' +
                                          CdsTexto.FieldByName('COMPLEMENTO').AsString,1,40),40)
              Else
                 sEndereco      := Spc(40);

              If CdsTexto.FieldByName('BAIRRO').Tag = 1 Then
                 sBairro        := AE(CdsTexto.FieldByName('BAIRRO').AsString,12)
              Else
                 sBairro        := Spc(12);

              If CdsTexto.FieldByName('CEP').Tag = 1 Then
                 sCep           := ZE(CdsTexto.FieldByName('CEP').AsString,8)
              Else
                 sCep           := Ze('0',8);

              If CdsTexto.FieldByName('CIDADE').Tag = 1 Then
                 sCidade        := AE(CdsTexto.FieldByName('CIDADE').AsString,15)
              Else
                 sCidade        := Spc(15);

              If CdsTexto.FieldByName('CODESTADO').Tag = 1 Then
                 sEstado        := AE(CdsTexto.FieldByName('CODESTADO').AsString,2)
              Else
                 sEstado        := Spc(2);

              WriteLn(ArquivoRemessa,
                      Concat('1', //codigo de registro - Obrigatório Para Alteração
                             '00',//codigo de inscricao
                             ZD('0',14), //numero de inscricao
                             ZD(EdtNumeEmpresa.Text,12), //codigo da empresa - Obrigatório Para Alteraçãp
                             Spc(8), //brancos
                             sIdentTit, //ident titulo empresa
                             sNossoNumero, //Nosso numero - - Obrigatório Para Alteração
                             ZD('0',13), //qtde moeda
                             Copy(CmbCarteira.Items[CmbCarteira.ItemIndex],4,3), {nª carteira - Obrigatório Para Alteração}
                             Spc(21), //brancos
                             Copy(CmbCarteira.Items[CmbCarteira.ItemIndex],1,1), {codigo carteira - - Obrigatório Para Alteração}
                             sCodOcorrencia, //codigo ocorrência
                             sNumDoc, {nº do documento}
                             sDataVencto, {data venciento}
                             sValor, {valor}
                             '341',  {codigo do banco}
                             Zd('0',5), //Agencia Depositária
                             '00', {especie do titulo}
                             ' ', {aceite}
                             '000000', {data emissao}
                             '00', {instrucao I}
                             '00', {instrucao II}
                             ZD('0',13), {juros por dia}
                             sDataLimite, {Data limite desconto}
                             sValorDesconto, {valor do desconto}
                             ZD('0',13), {valor outra moeda}
                             ZD('0',13), {valor abatimento}
                             sTipoInsc, {tipo inscricao do sacado}
                             sDocCliente, {nº inscricao do sacao}
                             sNomeCliente,
                             Spc(10), {brancos}
                             sEndereco,
                             sBairro,
                             sCep,
                             sCidade,
                             sEstado,
                             SPC(30), {Mesagem opcional}
                             SPC(4),
                             '000000',
                             '00',
                             ' ',
                             Zd(IntToStr(iNumSeq),6)));
              Inc(iNumSeq);
              CdsTexto.Next;
          End;

          //Trailer
          WriteLn(ArquivoRemessa,Concat('9',
                                        SPC(393),
                                        Zd(IntToStr(iNumSeq),6)));

          CloseFile(ArquivoRemessa);
          MostraArquivo;

          EdtGravaCarteira.Text := IntToStr(CmbCarteira.ItemIndex);
          EdtGravaEspecie.Text := IntToStr(CmbEspecie.ItemIndex);
     Except
        On E:Exception Do
        Begin
          MsgAviso('Erro ao gerar arquivo de remessa, tente novamente!' + (#13+#10) + E.Message,'Atenção');
          CloseFile(ArquivoRemessa);
          Raise;
        End;
     End;
  End;
  ModalResult:=mrOk;
end;

procedure TFrmAlteraRemessItauMT.bbtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmAlteraRemessItauMT.bbtnCancelarClick(Sender: TObject);
begin
  CmbEspecie.ItemIndex := -1;
  CmbCarteira.ItemIndex := -1;
end;

end.
