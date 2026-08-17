// Alterações
{**********************************************************************
Analista.: Henrique Massão
Pendencia: SOL 109421 KINTANA 496332
Data.....: 26/02/2009
Descrição: Alteração de gravação de arquivos de log na raiz do disco C:
**********************************************************************}
unit FGfipMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Spin, wwdbdatetimepicker,
  CMDateTimePicker, uCtrlGfip, Db, DBClient, uCMClientDataSet;

type
  TfrmGFIPMT = class(TfrmSairAjuda)
    gbxDataProcess: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtVencimento: TCMDateTimePicker;
    dtPagamento: TCMDateTimePicker;
    gbxDiaLimiteGRFC: TGroupBox;
    spedDiaLimiteGRFC: TSpinEdit;
    gbxCodRec: TGroupBox;
    speCodRec: TSpinEdit;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    Label12: TLabel;
    dblcPis: TwwDBLookupCombo;
    Label7: TLabel;
    dblcCBO: TwwDBLookupCombo;
    dblcCNPJ: TwwDBLookupCombo;
    Label4: TLabel;
    edtContato: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    edtCNAE: TEdit;
    rgSimples: TRadioGroup;
    edtFPAS: TEdit;
    Label6: TLabel;
    edtTerceiro: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    cdsDoc: TCMClientDataSet;
    svdlgDialogo: TOpenDialog;
    cdsGPS: TCMClientDataSet;
    cdsEstab: TCMClientDataSet;
    cdsTrabalhador: TCMClientDataSet;
    rbtnGerar: TBitBtn;
    procedure edtCNAEKeyPress(Sender: TObject; var Key: Char);
    procedure edtFPASKeyPress(Sender: TObject; var Key: Char);
    procedure edtTerceiroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    iInicio, iFim: integer;
    wHora, wMin, wSeg, wMSeg, wDiaComp, wMesComp, wAnoComp: word;

    iCodRec : word;   // Código de Recolhimento da GRE
    bArqAberto: boolean; // Indica se o Arquivo de Saída já foi aberto
    sRemSem13,           // Remuneração sem 13º
    sRemSobre13,         // Remuneração sobre 13º
    sDtComp,             // Data da Competência
    sDtRecPrev,          // Data de recolhimento Prev. Social
    sOcorrencia,         // Indica se o Trabalhador está exposto a agente nocivo
    sClassContrib,       // Classe de Contribuição para Trabalhador autônomo
    sFPAS,               // Código de FPAS
    sInscrForn,          // Incrição do Fornecedor da Folha (Responsável)
    sIndRecFGTS,
    sDataCompetencia,    // Indicador de recolhimento FGTS
    sMes: string;        // Mês de Referência
    cTipInscrForn,       // Tipo da Incrição do Fornecedor da Folha (Responsável)
    cIndRecPrev: string;   // Indicador de Recolhimento da Perv. Social
    fGFIP: TextFile;     // Arquivo de Saída
                        // todos os Registros 13 e 14 para cada Estabelecimento

    Gfip : TCtrlGfip;
    function VerificaOpcoesOk: boolean;  //verifica se as opções escolhidas estão de acordo
    procedure GerarRegistro00; //Informações do responsável
    procedure GerarRegistro10; //Informações da Empresa
    procedure GerarRegistro30; //registro do trabalhador
    procedure GerarRegistro90; //registro de fechamento do arquivo
    procedure Finaliza(Msg: string);
  public
    { Public declarations }
  end;

var
  frmGFIPMT: TfrmGFIPMT;

implementation

uses FileCtrl, uSistema, uMensErro, uDataBase, fAguarde, dBaseDados,
     uFuncoesUteisIR;

{$R *.DFM}

procedure TfrmGFIPMT.edtCNAEKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not ((key in ['0'..'9']) or (key in [#9, #16, #27, #8])) then
     Begin
       key := #0;
     end;
end;

procedure TfrmGFIPMT.edtFPASKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not ((key in ['0'..'9']) or (key in [#9, #16, #27, #8])) then
     Begin
       key := #0;
     end;
end;

procedure TfrmGFIPMT.edtTerceiroKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not ((key in ['0'..'9']) or (key in [#9, #16, #27, #8])) then
     Begin
       key := #0;
     end;
end;

procedure TfrmGFIPMT.Finaliza(Msg: string);
begin
  DecodeTime(Time,wHora,wMin,wSeg,wMSeg);
  iFim := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

  frmAguarde.Apaga;
  ShowMessage (Msg);
end;

procedure TfrmGFIPMT.FormCreate(Sender: TObject);
begin
  inherited;
  Gfip := TCtrlGfip.Create;
  Gfip.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  cdsDoc.data := Gfip.ListDoc;

end;

procedure TfrmGFIPMT.GerarRegistro00;
begin
  // 16-Código de recolhimento
  iCodRec := speCodRec.Value;
  // 15-Data da competência
  wDiaComp := TrazUltDiaMes(cmbMes.ItemIndex+1,speAno.Value);
  wMesComp := cmbMes.ItemIndex+1;
  wAnoComp := speAno.Value;
  sDtComp  := Gfip.Val_DtComp(IntToStr(speAno.Value)+PoeZero(cmbMes.ItemIndex+1), wMesComp, wAnoComp, iCodRec);
  // 17-Indicador de recolhimento do FGTS
  sIndRecFGTS := Gfip.Val_IndiRecFGTS(dtPagamento.Date,dtVencimento.Date, wMesComp, iCodRec);
  // 20-Indicador de recolhimento Prev. Social
  cIndRecPrev := Gfip.Val_IndiRecPrevSoc(cdsGPS.FieldByName('DATAVENCGRPS').asDateTime,
                                         cdsGPS.FieldByName('DATAFIMGRPS').asDateTime, wMesComp, wAnoComp, iCodRec);
  // 21-Data de recolhimento Prev. Social
  sDtRecPrev := Gfip.Val_DtRecPrevSoc(cdsGPS.FieldByName('DATAFIMGRPS').asString, cIndRecPrev);
  cTipInscrForn := '1';
  sInscrForn    := '29185659000141';
  // Gravo o registro
  Write (fGFIP,
          // 01-Tipo do registro
         '00'+
         // 02-Brancos
         Replicate (' ',51)+
         // 03-Tipo de Remessa
         '1'+
         // 04-Tipo de inscrição-responsável (1->CNPJ; 2->CEI; 3->CPF)
         '1'+
         // 05-Inscrição do responsável
         gfip.fValidaDadosGFIPMag('N', cdsEstab.FieldByName('INSCRICAO').asString, 14, ' ')+
         // 06-Nome do responsável (Razão social)
         gfip.fValidaDadosGFIPMag('*', cdsEstab.FieldByName('Razao').asString, 30,' ')+
         // 07-Nome da pessoa de contato
         gfip.fValidaDadosGFIPMag('A', edtContato.text, 20,' ')+
         // 08-RUA = Logradouro + Rua + nº + andar + apartamento
         gfip.fValidaDadosGFIPMag('*', cdsEstab.FieldByName('ENDERECO').asString, 50,' ')+
         // 09-Bairro
         gfip.fValidaDadosGFIPMag('*', cdsEstab.FieldByName('BAIRRO').asString, 20,' ')+
         // 10-Cep
         gfip.Val_CEP(cdsEstab.FieldByName('CEP').asString)+
         // 11-Cidade
         gfip.fValidaDadosGFIPMag('*', cdsEstab.FieldByName('CIDADE').asString, 20,' ')+
         // 12-UF
         gfip.fValidaDadosGFIPMag('A', cdsEstab.FieldByName('UF').asString, 2,' ')+
         // 13-Telefone de contato (DDD)
         gfip.fValidaDadosGFIPMag('N', cdsEstab.FieldByName('DDD').asString, 3,' ')+
         // 13-Telefone de contato (Número)
         gfip.fValidaDadosGFIPMag('N', cdsEstab.FieldByName('TELEFONE').asString, 9,' ')+
         // 14-Endereço INTERNET de contato
         Alinha (cdsEstab.FieldByName('EMAIL').asString, 60, 'E', ' ')+
         // 15-Data da competência
         sDtComp+
         // 16-Código de recolhimento
         IntToStr(iCodRec)+
         // 17-Indicador de recolhimento do FGTS
         sIndRecFGTS+
         // 18-Modalidade de Parcelamento do FGTS
         ' '+
         // 19-Data de recolhimento do FGTS
         Gfip.Val_DtRecFGTS(dtVencimento.Date, dtPagamento.Date, sIndRecFGTS)+
         // 20-Indicador de recolhimento Prev. Social
         cIndRecPrev+
         // 21-Data de recolhimento Prev. Social
         sDtRecPrev+
         // 22-Indice de recolhimento em atraso da Prev. Social
         '       '+ // EM BRANCO
         // 23-Tipo de Inscrição - Fornecedor Folha de Pagmento
         cTipInscrForn+
         // 24-Inscrição do Fornecedor - Folha de Pagamento
         sInscrForn+
         // 25-Brancos
         Replicate (' ',18)+
         // 26-Final de linha
         '*'+CR_LF);
end;

procedure TfrmGFIPMT.GerarRegistro10;
begin
  // Gravo o registro
  sFPAS := strZero(3,edtFPAS.text);
  Write (fGFIP,
         // 01-Tipo do registro
         '10'+
         // 02-Tipo de inscrição empresa (1->CNPJ; 2->CEI)
         '1'+//fValidaDadosGFIPMag('N', qryEstab.FieldByName('TIPO_INSCRICAO').asString, 1,' ')+
         // 03-Inscrição do empresa
         gfip.fValidaDadosGFIPMag('N', cdsEstab.FieldByName('INSCRICAO').asString, 14,' ')+
         // 04-Zeros
         Replicate ('0',36)+
         // 05-Razão social
         gfip.fValidaDadosGFIPMag('*', cdsEstab.FieldByName('RAZAO').asString, 40,' ')+
         // 06-RUA = Logradouro + Rua + nº + andar + apartamento
         gfip.fValidaDadosGFIPMag('*', cdsEstab.FieldByName('ENDERECO').asString, 50,' ')+
         // 07-Bairro
         gfip.fValidaDadosGFIPMag('*', cdsEstab.FieldByName('BAIRRO').asString, 20,' ')+
         // 08-Cep
         gfip.Val_CEP(cdsEstab.FieldByName('CEP').asString)+
         // 09-Cidade
         gfip.fValidaDadosGFIPMag('*', cdsEstab.FieldByName('CIDADE').asString, 20,' ')+
         // 10-UF
         gfip.fValidaDadosGFIPMag('A', cdsEstab.FieldByName('UF').asString, 2,' ')+
         // 11-Contato Telefone (DDD)
         gfip.fValidaDadosGFIPMag('V', cdsEstab.FieldByName('DDD').asString, 3,'0')+
         // 11-Contato Telefone (Número)
         gfip.fValidaDadosGFIPMag('V', cdsEstab.FieldByName('TELEFONE').asString, 9,'0')+
         // 12-Indicador de alteração de endereço
         gfip.Val_IndiAlteracao('N', wMesComp)+
         // 13-CNAE
         Alinha(edtCNAE.Text,7,'E','0')+
         // 14-Indicador de alteração CNAE
         gfip.Val_IndiAlteracao('N', wMesComp)+ // FALTA FAZER
         // 15-Alíquota SAT
         gfip.Val_AliqSAT(cdsGPS.FieldByName('SEGACIDTRABALHO').asFloat, SFPAS, wMesComp, wAnoComp, iCodRec, RgSimples.ItemIndex)+
         // 16-Código de centralização
         '0'+// //deve ser = 0 para o código de recolhimento 130 //Val_CodCentral (qryEstab.FieldByName('TIPO_INSCRICAO').asString,
         // 17-SIMPLES
         '1'+  //deve ser = 1 para o código de recolhimento 130  //IntToStr(rgSimples.ItemIndex+1)+
         // 18-FPAS
         sFPAS+
         // 19-Código de terceiros
         gfip.Val_CodTerceiros(edtTerceiro.Text, RgSimples.ItemIndex, iCodRec, wMesComp, wAnoComp)+
         // 20-Código de Pagamento GPS
         gfip.fValidaDadosGFIPMag('N', cdsGPS.FieldByName('CODIGOPAG').asString, 4,' ') +
         // 21-Percentual de Inseção de Filantropia
         '     '+
         // 22-Salário família
         Replicate ('0',15)+ //não preencher para o recolhimento 130   Val_SalFamilia10 (FormatFloat('#########0.00',dtmBaseDados.qry.FieldByName('SALARIO_FAM').asFloat))+
         // 23-Salário Maternidade
         Replicate ('0',15)+ //não preencher para o recolhimento 130  //Val_SalMaternidade (dtmBaseDados.qry.FieldByName('SALARIO_MAT').asString)+
         // 24-Contrib. Desc. Trabalhador Referente à Competência 13
         Replicate ('0',15)+ //não preencher para o recolhimento 130  //Val_ContDescEmpregado10 (dtmBaseDados.qry.FieldByName('CONT_DESC_EMPR').asString)+
         // 25-Indicador de valor negativo ou imposto
         '0'+ //Val_ValorDevPrev_Neg_Pos10(qryGPS.FieldByName('TOTAL').asFloat)+
         // 26-Valor devido à Prev. Soc. referente à Com. 13
         Replicate ('0',14)+
         // 27-Banco para débito em conta corrente. (IMPLEMENTAÇÃO FUTURA)
         Replicate (' ', 3)+
         // 28-Agência para débito em conta corrente. (IMPLEMENTAÇÃO FUTURA)
         Replicate (' ', 4)+
         // 29-Conta para débito em conta corrente. (IMPLEMENTAÇÃO FUTURA)
         Replicate (' ', 9)+
         // 30-(IMPLEMENTAÇÃO FUTURA)
         Replicate ('0', 15)+
         // 31-(IMPLEMENTAÇÃO FUTURA)
         Replicate ('0', 15)+
         // 32-(IMPLEMENTAÇÃO FUTURA)
         Replicate ('0', 15)+
         // 33-Brancos
         Replicate (' ', 4)+
         // 34-Final de linha
         '*'+CR_LF);
end;

procedure TfrmGFIPMT.GerarRegistro30;
var
  DataNascimento : string;
begin
  DataNascimento := '        ';
  // 16-Remuneração sem 13º
  sRemSem13 := gfip.Val_RemSem13(FormatFloat('#########0.00',cdsTrabalhador.FieldByName('Valor').asFloat), wMesComp);
  // 17-Remuneração sobre 13º
  sRemSobre13 := Replicate ('0', 15);
  // 18-Classe de Contribuição
  sClassContrib := Replicate (' ', 2);
  // 19-Ocorrência
  sOcorrencia := Replicate (' ', 2);
  // Gravo o registro no arquivo
  Write (fGFIP,
         // 01-Tipo do registro
         '30'+
         // 02-Tipo de inscrição-empresa (1->CNPJ; 2->CEI)
         gfip.fValidaDadosGFIPMag('N', cdsEstab.FieldByName('TIPO_INSCRICAO').asString, 1,' ')+
         // 03-Inscrição do responsável
         gfip.fValidaDadosGFIPMag('N', cdsEstab.FieldByName('INSCRICAO').asString, 14,' ')+
         // 04-Tipo de inscrição - tomador
         ' '+
         // 05-Inscrição tomador
         Replicate (' ', 14)+
         // 06-PIS/PASEP/CI
         gfip.fValidaDadosGFIPMag('N',  gfip.PegaNumeroDocumento(strToint(dblcPis.lookupvalue),  cdsTrabalhador.fieldByname('IDFORCLI').asInteger), 11, ' ')+
         // 07-Data de admissão
         '        '+ //não deve ser informado para a categoria 2
         // 08-Categoria do trabalhador
         '13'+
         // 09-Nome do trabalhador
         gfip.fValidaDadosGFIPMag('A', cdsTrabalhador.FieldByName('RAZAOSOCIAL').asString, 70,' ')+
         // 10-Matrícula do Trabalhador
         Replicate (' ', 11)+
         // 11-Número da CTPS
         Replicate (' ', 7)+
         // 12-Série da CTPS
         Replicate (' ', 5)+
         // 13-Data de opção
         Replicate (' ', 8)+
         // 14-Data de nascimento
         DataNascimento+
         // 15-CBO
         Alinha(gfip.PegaNumeroDocumento(strtoInt(dblcCBO.lookupValue),  cdsTrabalhador.fieldByname('IDFORCLI').asInteger),5,'D','0')+
         // 16-Remuneração sem 13º
         sRemSem13+
         // 17-Remuneração sobre 13º
         sRemSobre13+
         // 18-Classe de contribuição
         sClassContrib+
         // 19-Ocorrência
         sOcorrencia+
         // 20-Valor Retido Segurado - Multiplos Vínculos
         '000000000000000'+ // FALTA FAZER
         // 21-Remuneração para cálculo da Contribuição Previdenciária
         Replicate ('0', 15)+
         // 22-Base de cálculo 13º salário Prev. Soc. -
         Replicate ('0', 15)+  //zerar por enquanto
         // 23-Remuneração 13º salário Prev. Soc. - Base de Cálculo para a competência 13
         Replicate ('0', 15)+
         // 24-Brancos
         Replicate (' ',98)+
         // 25-Final de linha
         '*'+CR_LF);
end;

procedure TfrmGFIPMT.GerarRegistro90;
begin
  Write(fGFIP,
        '90'+                // 01-Tipo do registro
        Replicate('9',  51)+ // 02-Noves
        Replicate(' ', 306)+ // 03-Brancos
        '*'+CR_LF);          // 04-Final de linha
end;

procedure TfrmGFIPMT.rbtnGerarClick(Sender: TObject);
begin
  inherited;
  // Verifica se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
  begin
    frmAguarde.Apaga;
    exit;
  end;

  // Inicializa variáveis
  sMes := QuotedStr(speAno.Text +'/'+ PoeZero(cmbMes.ItemIndex + 1));

  frmAguarde.Mostra('Processando dados da GFIP...');
  frmAguarde.Update;
  frmAguarde.Pos := 0;

  frmAguarde.Mostra('Selecionando dados da GFIP...');
  frmAguarde.Update;

  //pegar dados do estabelecimento
  cdsEstab.data := Gfip.ListEstabelecimento(sistema.idEmpresa);

  //pegar dados dos trabalhadores avulso
  cdsTrabalhador.data := Gfip.ListTrabalhador(sistema.IdEmpresa, sDataCompetencia);

  frmAguarde.Max := cdsTrabalhador.RecordCount;
  frmAguarde.Min := 0;

  bArqAberto := False;
  // Associa e Cria/Recria o arquivo de GFIP
  AssignFile (fGFIP,svdlgDialogo.FileName);
  ReWrite    (fGFIP);
  bArqAberto := true;

  if not cdsTrabalhador.IsEmpty then
    Begin
      try
        frmAguarde.Mostra('Processando dados da GFIP...');
        frmAguarde.Update;
        frmAguarde.Pos := 0;

        frmAguarde.Max := cdsTrabalhador.RecordCount;
        frmAguarde.Min := 0;

        // Informações do responsável (header do arquivo)
        GerarRegistro00;
        // Informações da Empresa (header da Empresa)
        GerarRegistro10;

        Repeat
          // Registro do trabalhador
          GerarRegistro30;
          frmAguarde.Pos := frmAguarde.Pos + 1;
          cdsTrabalhador.Next;
        Until cdsTrabalhador.Eof;

        // *************************************
        // Registro Tipo '90' - Registro Trailer
        // *************************************
        GerarRegistro90;

        Finaliza('Arquivo SEFIP.RE gerado com sucesso!');
      except
        Finaliza('Erro durante a criação em '+svdlgDialogo.FileName);
      end;
     end
  else
    Finaliza('Não há dados a serem processados!');


   closeFile(fGFIP);

end;

function TfrmGFIPMT.VerificaOpcoesOk: boolean;
var
  wOpcao, Year, Month, Day : word;
begin
  Result := false;
  // Confirma os períodos com o usuário
  if (StrToDate(dtPagamento.Text) <> StrToDate(dtVencimento.Text)) then
    if (MsgDlg('Data do Pagamento diferente da Data do Vencimento. Continuar?','Aviso',
               mtConfirmation,[mbYes,mbNo],0) = mrNo) then
      exit;

  // Abro o diálogo de seleção do arquivo
  //Henrique Massão
  //if not(DirectoryExists('C:\SEFIP')) then
  if not(DirectoryExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\SEFIP '))then
  begin
  //Henrique Massão
    wOpcao := MsgDlg('Pasta Planus\Temp\SEFIP não foi encontrada. Deseja Criá-la?','Aviso',
              mtInformation,[mbYes,mbNo,mbCancel],0);
    if (wOpcao = mrYes) then
  //Henrique Massão
      CreateDir (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\SEFIP ')
    else
    if (wOpcao = mrCancel) or ((wOpcao = mrNo) and not(svdlgDialogo.Execute)) then
      exit;
  end;

  // Verifica se o arquivo existe na pasta escolhida
  if (FileExists(svdlgDialogo.FileName)) then
    if (MsgDlg ('O arquivo já existe na pasta especificada. Você deseja sobrescrevê-lo?',
                'Aviso',mtConfirmation,[mbYes,mbNo],0) = mrNo) then
      exit;

  // Verifica se há alguma GRPS cadastrada na data
  DecodeDate(dtVencimento.Date, Year, Month, Day);

  sDataCompetencia :=  strZero(2, intTostr(Month)) + '/' + intTostr(Year);

  cdsGPS.data := Gfip.ListGPS(sDataCompetencia);

  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Mostra('Verificando geração de GPS...');

  if (not cdsGPS.IsEmpty) then //teste
  begin
    MsgDlg ('GPS do Mês selecionado não foi gerada !','Aviso', mtInformation,[mbOK,mbHelp],0);
    exit;
  end;

  DecodeTime(Time, wHora, wMin, wSeg, wMSeg);
  iInicio := wMSeg + 1000 * wSeg + 60000 * wMin + 3600000 * wHora;

  Result := true;
end;

procedure TfrmGFIPMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Gfip.free;
end;

end.
