//Rotina: -
//Nº SOL: 230280
//Nº PPM: 351159
//Data da Alteração: 17/04/2014
//Alteração Form: Alteração no DFM. inclusão do campo FLGPERDAEFETIVA.
//Responsável: Felipe A. Santos
//Descrição: inclusão do campo FLGPERDAEFETIVA na qry.
//------------------------------------------------------------------------------
//Pendência   : SOL 206337 Kintana 1996861
//Responsável : Thiago Melo
//Data        : 07/05/2013
//Descrição   : Valor de descontos de emprestimo não está sendo apresentado para
//              o Reb.
//------------------------------------------------------------------------------
//Pendência   : SOL 167335
//Responsável : Thiago Melo, Bruno Santos
//Data        : 06/2012
//Descrição   : ajustes relatório extrato dos institutos
//------------------------------------------------------------------------------
//Pendência   : SOL 140376 Kintana 877601
//Responsável : Renato Visoni
//Data        : 22/07/2010
//Descrição   : Alteração no modo de calcular os se o participante tem 3 anos de
//                contribuição.
//------------------------------------------------------------------------------


unit uPextratoDesligamento;

interface                                                                  

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrd2, TB97Ctls, MontaSelect, Db, DBTables, Wwquery,
  Wwdatsrc, Wwdbgrid, ppComm, ppRelatv, ppProd, ppClass, ppReport, TREdit,
  wwdbdatetimepicker, CMDateTimePicker,UctrlExtratoDesligamento,DBaseDados, uSistema,
  wwstorep, UcalcEmptmo,uTypesEmptmo,dEmptmo,dCalcEmptmo,dLookEmptmo, uCtrlObjIrrf;

type

  TfrmPExtratoDesligamento = class(TfrmParamReports_Padrao)
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnProcurar: TToolbarButton97;
    Panel1: TPanel;
    pnlInfPessoa: TPanel;
    lbNome: TLabel;
    lbMatricula: TLabel;
    lbCpf: TLabel;
    Label4: TLabel;
    edtNome: TEdit;
    edtMatricula: TEdit;
    edtCpf: TEdit;
    edtDataNascimento: TEdit;
    pnl13: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    MontaConsulta: TMontaSelect;
    MontaSelect1: TMontaSelect;
    Label1: TLabel;
    dsGrid: TwwDataSource;
    qryGrid: TwwQuery;
    BitBtn1: TBitBtn;
    edtDataBase: TCMDateTimePicker;
    edtFatorAtuarial: TRealEdit;
    edtReservaMatematica: TRealEdit;
    QryCotas: TwwQuery;
    QryAux: TwwQuery;
    upd: TUpdateSQL;
    QryAux1: TwwQuery;
    Proc_Salario: TwwStoredProc;
    SpPrazoAcumulacao: TwwStoredProc;
    Button1: TButton;
    qry: TwwQuery;
    qryINSCRICAO: TFloatField;
    qryFLGINTERNET: TFloatField;
    qryINSCRICAONUMERO: TFloatField;
    qryDESCSITCONTRATO: TStringField;
    qryDESCFLGFORMAPAG: TStringField;
    qryDESCFLGFORMAREC: TStringField;
    qryDESCCODFORMAPAG: TStringField;
    qryDESCPORTFORMAPAG: TStringField;
    qryDESCPORTFORMAREC: TStringField;
    qryIDSITPART: TFloatField;
    qrySITUACAO: TStringField;
    qryFLGINTERNO: TStringField;
    qryPLANOPREV: TStringField;
    qryPATRO: TStringField;
    qryMATRICULA: TStringField;
    qryTITULAR: TStringField;
    qryBENEFICIARIO: TStringField;
    qryTCEDESCRICAO: TStringField;
    qryIDTIPOEMPTMO: TFloatField;
    qryDESCTIPOEMPTMO: TStringField;
    qryDATAINSC: TDateTimeField;
    qryBANCO: TStringField;
    qryCONTACORRENTE: TStringField;
    qryNUMAGENCIA: TStringField;
    qryIDCONTRATOEMPTMO: TFloatField;
    qryIDCONTRQUITACAO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryIDVERBA: TFloatField;
    qryIDTIPOCONTREMPTMO: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDPATRO: TFloatField;
    qryNUMPARCELAS: TFloatField;
    qryIDINSCRICAOEMPTMO: TFloatField;
    qryIDBENEF: TFloatField;
    qryIDCBANCARIA: TFloatField;
    qryIDCBANCARIADEB: TFloatField;
    qryCODFORMAPAG: TFloatField;
    qryPORTFORMAPAG: TFloatField;
    qryPORTFORMAREC: TFloatField;
    qryDATACANC: TDateTimeField;
    qryDATACREDITO: TDateTimeField;
    qryDATASITUACAO: TDateTimeField;
    qryDATAASSINATURA: TDateTimeField;
    qryDATAPRIMPARC: TDateTimeField;
    qryVLRCONTRATO: TFloatField;
    qryVLRPARCELA: TFloatField;
    qryTXJUROS: TFloatField;
    qryFLGSITUACAO: TStringField;
    qryFLGFORMAREC: TStringField;
    qryFLGFORMAPAG: TStringField;
    qryVLRSALBASE: TFloatField;
    qryVLRMARGEM: TFloatField;
    qryVLRMAXPERMIT: TFloatField;
    qryMOECODIGO: TFloatField;
    qryIDTIPOSUSPEMPTMO: TFloatField;
    qryDATAINICIOSUSP: TDateTimeField;
    qryDATAFIMSUSP: TDateTimeField;
    qryANOSUSPENSAO: TFloatField;
    qryMESSUSPENSAO: TFloatField;
    qryIDPLANOORIGEM: TFloatField;
    qryMOESIGLA: TStringField;
    qryTSEDESCRICAO: TStringField;
    qryNOMERESPONSAVEL: TStringField;
    qryBANCODEB: TStringField;
    qryCONTACORRENTEDEB: TStringField;
    qryNUMAGENCIADEB: TStringField;
    qryNUMPARCDESCONTO: TFloatField;
    qrySITUACAO_PLANO: TStringField;
    qrySITUACAO_FUNC: TStringField;
    qrySITUACAO_INT: TStringField;
    qrySITUACAO_INT_PLANO: TStringField;
    qrySITUACAO_INT_FUNC: TStringField;
    qryPLANOORIGEM: TStringField;
    qryTCELEGENDAEXIBE: TStringField;
    qryTCELEGENDACALC: TStringField;
    qryCEDIDO: TStringField;
    qryCODAUTOEMP: TFloatField;
    qryFORNCREDITO: TStringField;
    qryFLGUSAMARGEMALT: TFloatField;
    dbgrdGrid: TwwDBGrid;
    qryFLGPERDAEFETIVA: TFloatField; // Nº SOL: 230280 Nº PPM: 351159 - Felipe A. Santos

    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrdGridKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Resgate        : Boolean;
    Portabilidade  : Boolean;
    AutoPatrocinio : Boolean;

    BPD            : Boolean;
    { Private declarations }
  public
    iIdPessJur: Integer;
    iIdPessoa : Integer;
    sMatricula: String;

    fValorResgateBrutoNovoPLano: Real;
    fResgateBrutoREB : Real;
    fValorResgateBrutoREGREPLAN : Real;

    DescontoEmptmoRegReplan    : Real;
    DescontoNovoPlano : Real;
    fDESCONTOREBQ     : Real;

    rSalarioRegReplan : Real;
    rSalarioNovoPlano : Real;
    rSalarioREB       : Real;

    fValorIrrfREB       : Real;
    fValorIrrfNOVOPLANO : Real;
    fValorIrrfREGREPLAN : Real;

    procedure Sel(i: Extended);


    Function VerificaCampos():Boolean;
    Function SysDate: TDateTime;
    Function Tem3AnosContribuicao(idPessoa,idPLanoPrev,idpessJur : Integer): Boolean;
    Procedure PreparaDados;
    Procedure CalculaIrrf(ValorResgate: Double; TipoIrrf : integer; Ano:String; iPLano : Integer);
    Procedure DividaEmprestimo(pIdPessoa : String);
    Procedure SalarioParticipacao(pIdPessJur,pIdPessoa, pIdPlanoPrev : Integer);
    // Thiago Melo SOL 167335
    Procedure InsereSexoIdade(xIdPessoa : Integer);
    Function CarregarSexo (xIdPessoa : Integer) : String;
    Function CarregarIdade (xIdPessoa : Integer): Integer;
    Function VerificaEAposentado (xIdPessoa, xIdPlanoPrev : Integer) : Boolean;
    Function VerificarExisteDemissao (xIdPessoa : Integer) : String;
    Function ValidarPossuiMais3AnosContribuicao (xIdPessoa, xIdPlanoPrev : Integer): Boolean;
    Function Elegibilidade_Resgate_Portabilidade (xIdPessoa : Integer) : Boolean;
    Function Elegibilidade_AutoPatrocinio (xIdPessoa : Integer) : Boolean;
    function ValidarPossuiMais10AnosContribuicao (xIdPessoa : Integer) : Boolean;
    function ValidarSemResgatePortabilidadeouBeneficioRendaContinuada (xIdPessoa, xIdPlanoPrev : Integer; xRegraElegibilidade : SmallInt) : Boolean;
    Function BPDElegibilidade : Boolean; // RN006
    Function ElegibilidadeBeneficioDeRendaContinuada (xTipo : SmallInt) : Boolean; // RN007
    Function RetornaDataIncricao (xIdPessoa : Integer) : String;
    Function RetornaDataDemissao (xIdPessoa : Integer) : String;
    Function RetornaDataCancelamento (xIdPessoa : Integer) : String;
    Function RetornaQtdeMesesAutoPatrocinio (xIdPessoa : Integer) : Integer;
    Function SubtrairMesesAutoPatrocinio (AnoMes : String; QtdeMes : Integer) : String;
    Function Inscricao (xIdPessoa : Integer) : String;

    Function DefineElegibilidade_Portabilidade (xPlano : SmallInt; DtInscricao : String) : Boolean; // RN013
    Function DefineElegibilidade_Resgate (xPlano : SmallInt) : Boolean; //RN018
    Function DefineElegibilidade_AutoPatrocinio (xPlano : SmallInt) : Boolean; // RN022
    // Thiago Melo SOL 167335

    //BRUNO AZEVEDO SOL 167335 - CARREGAR OS VALORES BRUTO DE RESERVA DO REB
    function ReservasResgataveisREB(pMatricula: String): Currency;
    //BRUNO AZEVEDO SOL 167335 - CARREGAR OS VALORES BRUTO DE RESERVA DO NOVO PLANO
    function ReservasResgataveisNOVOPLANO(pMatricula: String): Currency;
    //BRUNO AZEVEDO SOL 167335 - CALCULO DO IR PARA REGREPLAN
    function CalculoIrrfRegReplan(pMatricula: String; pValorBruto: Double): Currency;
    //BRUNO AZEVEDO SOL 167335 - CARREGAR OS VALORES BRUTO DE RESERVA DO REGREPLAN
    function ReservasREGREPLAN(pMatricula: String; pFlgResgatavel: Boolean): Currency;
    //BRUNO AZEVEDO SOL 167335 - CARREGA INDICE CUSTEIO ADMINISTRATIVO E CUSTEIO DE RISCO
    function CarregaIndiceAdmRisco(pTabela, pCodCampo: String): Double;
    Function EventoBPD (xIdPessoa : Integer) : Boolean;

    { Public declarations }
  end;

var
  frmPExtratoDesligamento: TfrmPExtratoDesligamento;

implementation

uses dRelExtratoDesligamento,fMostraRelat,uMensErro;

{$R *.DFM}

procedure TfrmPExtratoDesligamento.sbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MontaConsulta.Executar;

  if (MontaConsulta.RetornouValor) then begin
    edtMatricula.Text      := MontaConsulta.ValoresChave[0];
    sMatricula             := MontaConsulta.ValoresChave[0];
    edtCpf.Text            := MontaConsulta.ValoresChave[1];
    edtNome.Text           := MontaConsulta.ValoresChave[2];
    edtDataNascimento.Text := MontaConsulta.ValoresChave[3];
    iIdPessoa              := strToInt(MontaConsulta.ValoresChave[4]);
    iIdPessJur             := strToInt(MontaConsulta.ValoresChave[5]);

    edtDataBase.Text       := '';
    edtFatorAtuarial.text  := '';
    edtReservaMatematica.Text   := '';

    QryGrid.Close;
    QryGrid.Parambyname('Idpessoa').asInteger := strToint(MontaConsulta.ValoresChave[4]);
    QryGrid.Open;

    QryGrid.first;
    
    While not QryGrid.EOF do begin
      qryGrid.Edit;
       SalarioParticipacao(iIdPessJur,iIdPessoa,qryGrid.fieldByname('IDPLANOPREV').asInteger);

       if qryGrid.fieldByname('IDPLANOPREV').asInteger = 2 then begin
         qryGrid.FieldByname('SALPARTICIPACAO').asString := FormatFloat('##,###0.00',rSalarioRegReplan);
       end else if qryGrid.fieldByname('IDPLANOPREV').asInteger = 66 then begin
         qryGrid.FieldByname('SALPARTICIPACAO').asString := FormatFloat('##,###0.00',rSalarioREB);
       end else if qryGrid.fieldByname('IDPLANOPREV').asInteger = 74 then begin
         qryGrid.FieldByname('SALPARTICIPACAO').asString := FormatFloat('##,###0.00',rSalarioNovoPlano);
       end;

      qryGrid.Post;
      QryGrid.next;
    end;
    QryGrid.first;

    // Thiago Melo SOL 167335
    edtDataBase.Text := DateToStr(Now);
    // Thiago Melo SOL 167335
  end else begin

    edtMatricula.Text      := '';
    edtCpf.Text            := '';
    edtNome.Text           := '';
    edtDataNascimento.Text := '';

    edtDataBase.Text       := '';
    edtFatorAtuarial.text  := '';
    edtReservaMatematica.text   := '';
    QryGrid.Close;
  end;

end;

procedure TfrmPExtratoDesligamento.FormShow(Sender: TObject);
begin
  inherited;

  sbtnProcurar.Click;
  
end;

procedure TfrmPExtratoDesligamento.dbgrdGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  //key := #;

end;

procedure TfrmPExtratoDesligamento.bbtnConfirmarClick(Sender: TObject);
var teste : string;
begin
  inherited;
end;

function TfrmPExtratoDesligamento.VerificaCampos: Boolean;
var sMsg : string;
begin

 dtmRelExtratoDesligamento.bRegReplan        := False;
 dtmRelExtratoDesligamento.bNovoPlano        := False;
 dtmRelExtratoDesligamento.bReb              := False;
 dtmRelExtratoDesligamento.bRegReplanSaldado := False;
 dtmRelExtratoDesligamento.sMatricula        := edtMatricula.text;
 dtmRelExtratoDesligamento.sNome             := edtNome.Text;

 Result := True;

 if QryGrid.Active then begin
   QryGrid.First;

   While not qryGrid.Eof do begin
     sMsg :='';
     if qryGrid.FieldByname('SELECIONADO').asInteger = 1 then begin

       //Tratar Data Base
       if edtDataBase.Date <= 0 then begin
         sMsg := 'Favor preencher Data Base';
       end;

       //Trata Reserva Matematica
       if (qryGrid.FieldByname('IDPLANOPREV').asString = '2') and (edtReservaMatematica.Value=0) then begin
         sMsg :='O campo Reserva Matemática, deve ser preenchido, para geração do Extrato dos institutos para o REG/REPLAN.'
       end;

       //Tratar fator Atuarial
       if (edtFatorAtuarial.Value = 0)  then begin
          //sMsg := 'O campo Fator Atuarial, deve ser preenchido.';
          edtFatorAtuarial.Value := 1;
       end;



       //Tratar Data Demissão
       if qryGrid.FieldByname('DATADEMISSAO').AsDateTime > SysDate then begin
         sMsg := 'Data de desligamento não pode ser superior a data de geração do extrato, favor verifique';
       end else if qryGrid.FieldByname('DATADEMISSAO').asDateTime <= qryGrid.FieldByname('DATAADMISSAO').asDateTime then begin
         sMsg := 'Data de desligamento não pode ser inferior/igual à data de admissão na patrocinadora, favor verifique';
       end else if qryGrid.FieldByname('DATADEMISSAO').asDateTime <= qryGrid.FieldByname('INSCRICAODATA').asDateTime then begin
         sMsg := 'Data de desligamento não pode ser inferior/igual à data de inscrição na fundação, favor verifique';
       end;


       if sMsg <> '' then begin
         MessageBox(Handle,pChar(sMsg),'Aviso',MB_ICONINFORMATION);
         Result := False;
         exit;
       end;

       if qryGrid.FieldByname('IDPLANOPREV').asString = '2' then  dtmRelExtratoDesligamento.bRegReplan         := True;
       if qryGrid.FieldByname('IDPLANOPREV').asString = '74' then dtmRelExtratoDesligamento.bNovoPlano         := True;
       if qryGrid.FieldByname('IDPLANOPREV').asString = '66' then dtmRelExtratoDesligamento.bReb               := True;

       if (qryGrid.FieldByname('IDPLANOPREV').asString = '2') and (qryGrid.FieldByname('IDSITPLANOPREV').asString = '25')
         then  dtmRelExtratoDesligamento.bRegReplanSaldado  := True;

     end;
     qryGrid.Next;
   end;
 end else begin
   Result := False;
 end;


 Result := ((dtmRelExtratoDesligamento.bRegReplan) or (dtmRelExtratoDesligamento.bNovoPlano) or (dtmRelExtratoDesligamento.bReb))

end;

procedure TfrmPExtratoDesligamento.BitBtn1Click(Sender: TObject);
begin
  inherited;

  if verificaCampos then begin
    PreparaDados;

    with dtmRelExtratoDesligamento do begin
      cds.first;
      While not cds.Eof do begin
        if (trim(cds.FieldByname('Nome').Asstring) ='') then begin
          cds.Delete;
        end else begin
          cds.Next;
        end;
      end;
    end;

    bbtnConfirmar.Click;
  end;

end;



function TfrmPExtratoDesligamento.SysDate: TDateTime;
var
   qrySysDate : TwwQuery;
begin
   Result := 0;

   try
      qrySysDate              := TwwQuery.Create(Application);
      qrySysDate.DatabaseName := 'BaseDados';

      qrySysDate.SQL.Text     := 'SELECT SYSDATE FROM DUAL';

      try
         qrySysDate.Open;
         Result := trunc(qrySysdate.FieldByName('SYSDATE').AsDateTime);
      except
      end;

   finally
      qrySysDate.Close;
      qrySysDate.Free;
   end;

end;

procedure TfrmPExtratoDesligamento.PreparaDados;
var
  sSql : String;
  DataInscricao : String;
CtrlExtratoDesligamento :  TCtrlExtratoDesligamento;
var

    vlrCotas, vlrReservaPoup, vlrReservaBPD, ValorBPD,ValorPortado,ValorPortadoOutroPlano : Double;
    ValorResgateTrib,ValorResgateNaoTrib,ValorResgateBruto,ValorIrrf,ValorLiquido: Double;
    vlrSaldoConta,ValorPortadoNovoPlano,ValorPortadoOutroNovoPlano: Double;
    ResgateBrutoNovoPlano,irrfNovoPlano,vlrLiquidoNovoPLano,ValorPatro: double;
    b3AnosContrib : Boolean;
    vlrCusteiAdmReb,vlrPortadoReb : Double;
    PercentualSalPart,PercentualSalPatro : double;
    sOpcaoIrRegReplan,sOpcaoIrNovoPlano, sOpcaoIrREB : integer;

    //BRUNO AZEVEDO SOL 167335
    dCusteioAdm, dCusteioRisco: Double;
begin

  try

    with dtmRelExtratoDesligamento do begin

      CtrlExtratoDesligamento := TCtrlExtratoDesligamento.Create;

      CtrlExtratoDesligamento.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

      //CtrlExtratoDesligamento.MontaSQL(bRegReplan, bNovoPlano, bReb, cds);

      sOpcaoIrRegReplan   :=0;
      sOpcaoIrNovoPlano   :=0;
      sOpcaoIrREB         :=0;
      fValorIrrfREB       :=0;
      fValorIrrfNOVOPLANO :=0;
      fValorIrrfREGREPLAN :=0;

      cds.Insert;
      cds.FieldByname('MATRICULA').asString             := sMatricula;
      cds.FieldByname('NOME').asString                  := edtNome.Text;
      cds.FieldByname('DataBaseCalc').asString          := edtDataBase.Text;

      // Thiago Melo SOL 167335
      InsereSexoIdade(iIdPessoa);
      // Thiago Melo SOL 167335


      //Alimenta as Variaveis da Divida3 de Emprestimo
      DividaEmprestimo(intTostr(iIdPessoa));

      // Thiago Melo SOL 167335
      Resgate        := False;
      Portabilidade  := False;
      AutoPatrocinio := False;
      BPD            := False;

      if bRegReplan then begin
        ppLabel4.Visible  := False;
        ppLabel5.Visible  := False;
        ppLabel18.Visible := False;
        ppDBText1.Visible := False;
        ppDBText2.Visible := False;
        ppDBText3.Visible := False;
      end
      else begin
        ppLabel4.Visible  := True;
        ppLabel5.Visible  := True;
        ppLabel18.Visible := True;
        ppDBText1.Visible := True;
        ppDBText2.Visible := True;
        ppDBText3.Visible := True;

      end;
      // Thiago Melo SOL 167335      

      //Preparando os Dados do REG\REPLAN
      if bRegReplan then begin

        //Salario de Participacao
        SalarioParticipacao(iIdPessJur,iIdPessoa,2);

        fValorResgateBrutoREGREPLAN := 0;
        b3AnosContrib         :=False;
        vlrCotas              :=0;
        vlrReservaPoup        :=0;
        vlrReservaBPD         :=0;
        ValorBPD              :=0;
        ValorPortado          :=0;
        ValorResgateTrib      :=0;
        ValorResgateNaoTrib   :=0;
        ValorResgateBruto     :=0;
        ValorIrrf             :=0;
        ValorLiquido          :=0;
        ValorPortadoOutroPlano:=0;

        // RN006
        // Verificando se existem os três anos (ou 36 meses) de contribuição
        b3AnosContrib := Tem3AnosContribuicao(iIdPessoa,2,iIdPessJur);

        //Busca o valor de Cotas do Participante
        QryCotas.Close;
        QryCotas.ParamByName('IDPESSJUR').AsInteger   := iIdPessJur;
        QryCotas.ParamByName('IDPESSOA').AsInteger    := iIdPessoa;
        QryCotas.ParamByName('IDPLANOPREV').Asstring  := '2';
        QryCotas.Open;

        vlrCotas := QryCotas.FieldByName('COTVALOR').asFloat;
        if vlrCotas = 0 then vlrCotas :=1;

        // Busca todas as Reservas
        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('SELECT A.IDPESSOA,A.MATRICULA,HH.IDTIPORESERVA,');
        QryAux.SQL.Add('SUM(DECODE(HH.FLGENTRADA,1,HH.VLRCOTAS,-HH.VLRCOTAS)) AS VALORCOTAS');
        QryAux.SQL.Add('  FROM');
        QryAux.SQL.Add('   ELEGPATRO A,');
        QryAux.SQL.Add('   HISTMOVRESERVA HH');
        QryAux.SQL.Add('  WHERE');
        QryAux.SQL.Add('      A.IDPESSOA = HH.IDPESSOA');
        QryAux.SQL.Add('  AND A.IDPESSJUR = HH.IDPESSJUR');
        QryAux.SQL.Add('  AND HH.IDPLANOPREV = 2');
        QryAux.SQL.Add('  AND HH.IDPESSJUR ='+intToStr(iIdPessJur));
        QryAux.SQL.Add('  AND HH.IDTIPORESERVA IN (3,73,119,120,174)');
        QryAux.SQL.Add('  AND A.MATRICULA ='+QuotedStr(sMatricula));
        QryAux.SQL.Add(' GROUP BY A.IDPESSOA ,A.MATRICULA,HH.IDTIPORESERVA');
        QryAux.Open;

        //Reserva de Poupança
        QryAux.First;
        While not QryAux.eof do begin
          vlrReservaPoup := vlrReservaPoup + QryAux.FieldByname('VALORCOTAS').AsFloat;
          //Valor Portado Outro Plano
          if (QryAux.FieldByname('IDTIPORESERVA').asString ='119') or (QryAux.FieldByname('IDTIPORESERVA').asString ='120')then begin
            ValorPortadoOutroPlano := ValorPortadoOutroPlano + QryAux.FieldByname('VALORCOTAS').AsFloat;
          end;
          if (QryAux.FieldByname('IDTIPORESERVA').asString ='73') then begin //valor não Tributavel
            ValorResgateNaoTrib := ValorResgateNaoTrib + QryAux.FieldByname('VALORCOTAS').AsFloat;
          end else begin
            ValorResgateTrib := ValorResgateTrib + QryAux.FieldByname('VALORCOTAS').AsFloat;// valor Tibutavel
          end;
          QryAux.next;
        end;
        QryAux.First;

        //Reserva para o BPD
        if edtReservaMatematica.Value > (vlrReservaPoup* vlrCotas) then begin
          vlrReservaBPD := edtReservaMatematica.Value
        end else begin
          vlrReservaBPD := vlrReservaPoup * vlrCotas;
        end;

        //Valor do BPD
        //ValorBPD := (vlrReservaBPD/edtFatorAtuarial.Value);
        //SOL167335

        //Cabeçalho
        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('SELECT * FROM PESSOA WHERE IDPESSOA = ' +intTostr(iIdPessJur));
        QryAux.Open;

        cds.FieldByname('PATROCINADORREGREPLAN').asString := QryAux.FieldByname('RazaoSocial').ASstring;

        //Localiza a Data de Recisao do PLano
        qryGrid.Locate('IDPLANOPREV',('2'),[]);
        ValorBPD := qryGrid.FieldByname('VALORBPD').AsFloat;
        cds.FieldByname('DATARECISAOREGREPLAN').asString  := qryGrid.FieldByname('DATADEMISSAO').asstring;

        QryAux1.Close;
        QryAux1.SQL.Clear;
        QryAux1.SQL.Add('SELECT INSCRICAODATA,NVL(TIPOOPCAOIR,0) as TIPOOPCAOIR FROM PARTPREVPLAN WHERE IDPESSJUR='+intTostr(iIdPessJur));
        QryAux1.SQL.Add('AND IDPESSOA='+intTostr(iIdPessoa));
        QryAux1.SQL.Add('AND IDPLANOPREV=2');

        QryAux1.Open;

        cds.FieldByname('DATAINSCRICAOREGREPLAN').asString := QryAux1.FieldByname('INSCRICAODATA').asString;
        sOpcaoIrRegReplan                                  := QryAux1.FieldByname('TIPOOPCAOIR').asInteger;

        // Inicio RN006
        // Verificando Se existe data de demissao


        QryAux1.Close;
        QryAux1.SQL.Clear;
        QryAux1.SQL.Add('SELECT DATAADMISSAO FROM ELEGPATRO WHERE IDPESSJUR='+intTostr(iIdPessJur));
        QryAux1.SQL.Add('AND IDPESSOA='+intTostr(iIdPessoa));

        QryAux1.Open;

        cds.FieldByname('DATAADMISSAOREGREPLAN').AsString := QryAux1.FieldByname('DATAADMISSAO').asString;

        // Verificando se existem os três anos (ou 36 meses) de contribuição

        if (not BPDElegibilidade) then
        begin
          dtmRelExtratoDesligamento.lblNaoElegivelBPDRegReplan.Caption := 'Elegível';
          cds.FieldByname('ReservaBPDQ').asString   := FormatFloat('##,###0.00',vlrReservaBPD);
          cds.FieldByname('ValorBPDQ').asString     := FormatFloat('##,###0.00',(ValorBPD));
        end
        else begin
          dtmRelExtratoDesligamento.lblNaoElegivelBPDRegReplan.Caption := 'Não Elegível';
          cds.FieldByname('ReservaBPDQ').asString   := 'Não Elegível';
          cds.FieldByname('ValorBPDQ').asString     := 'Não Elegível';
        end;
        //if  b3AnosContrib then begin // se nao tiver 3 anos de contribuição nao deve gerar BPD
          // 1 - Beneficio Proporcional Diferido - BPD
          //cds.FieldByname('ReservaMatQ').asString   := FormatFloat('##,###0.00',edtReservaMatematica.Value);
          //.FieldByname('ReservaPoupQ').asString  := FormatFloat('##,###0.00',(vlrReservaPoup * vlrCotas));
        //  cds.FieldByname('ReservaBPDQ').asString   := FormatFloat('##,###0.00',vlrReservaBPD);
        //  cds.FieldByname('ValorBPDQ').asString     := FormatFloat('##,###0.00',(ValorBPD));
        //end else begin
         // cds.FieldByname('ReservaMatQ').asString   := 'Não Elegível';
          //.FieldByname('ReservaPoupQ').asString  := 'Não Elegível';
        //  cds.FieldByname('ReservaBPDQ').asString   := 'Não Elegível';
        //  cds.FieldByname('ValorBPDQ').asString     := 'Não Elegível';
        //end;


        //2 - Portabilidade
        //Valor a Ser Portado
        if (vlrReservaPoup* vlrCotas) > edtReservaMatematica.Value then begin
          ValorPortado := vlrReservaPoup* vlrCotas;
        end else begin
          if (edtReservaMatematica.Value/(vlrReservaPoup* vlrCotas)) > 2 then begin
            ValorPortado := ((vlrReservaPoup* vlrCotas)*2);
          end else begin
            ValorPortado := edtReservaMatematica.Value;
          end;
        end;

        //BRUNO AZEVEDO SOL 167335
        DataInscricao    := Inscricao(iIdPessoa);
        DefineElegibilidade_Portabilidade(2, DataInscricao);
        if (dtmRelExtratoDesligamento.lblNaoElegivelPortabilidadeRegReplan.Caption = 'Elegível') then begin
          cds.FieldByname('VALORPORTADOQ').asString            := FormatFloat('##,###0.00',(ValorPortado));
        end else begin
          cds.FieldByname('VALORPORTADOQ').asString            := 'Não Elegível';
        end;

        if (ValorPortadoOutroPlano <> 0 ) then begin
          cds.FieldByname('VALORPORTADOOUTROPLANOQ').asString  := FormatFloat('##,###0.00',(ValorPortadoOutroPlano));
        end else begin
          cds.FieldByname('VALORPORTADOOUTROPLANOQ').asString  := 'Não Elegível';
        end;

        // Renato Visoni SOL 136086 Kintana 811975
        //if b3AnosContrib then begin // se nao tiver 3 anos de contribuição nao deve gerar Portabilidade
          // Valor portado de Outro Plano
        //  cds.FieldByname('VALORPORTADOQ').asString            := FormatFloat('##,###0.00',(ValorPortado));
        //end else begin
        //  cds.FieldByname('VALORPORTADOQ').asString            := 'Não Elegível';
        //end;

        //if (b3AnosContrib) or (ValorPortadoOutroPlano <> 0 ) then begin
        //  cds.FieldByname('VALORPORTADOOUTROPLANOQ').asString  := FormatFloat('##,###0.00',(ValorPortadoOutroPlano));
        //end else begin
        //  cds.FieldByname('VALORPORTADOOUTROPLANOQ').asString  := 'Não Elegível';
        //end;
        // Renato Visoni SOL 136086 Kintana 811975

        //3- RESGATE
        //BRUNO AZEVEDO - COLOCADO AQUI
        DefineElegibilidade_Resgate(2);
        //BRUNO AZEVEDO SOL 167335 - SOMENTE PROGRESSIVO COM BASE NA TABELA DE IR VIGENTE
        if (dtmRelExtratoDesligamento.lblNaoElegivelResgateRegReplan.Caption = 'Elegível') then begin
          ValorResgateTrib    := ReservasREGREPLAN(sMatricula, True);
          ValorResgateNaoTrib := ReservasREGREPLAN(sMatricula, False);
          ValorIrrf           := CalculoIrrfRegReplan(sMatricula,ValorResgateTrib); 

          cds.FieldByname('VALORRESGATETRIBQ').asString    := FormatFloat('##,###0.00', ValorResgateTrib);
          cds.FieldByname('VALORRESGATENAOTRIBQ').asString := FormatFloat('##,###0.00', ValorResgateNaoTrib);
          cds.FieldByname('VALORRESGATEBRUTOQ').asString   := FormatFloat('##,###0.00', ValorResgateTrib + ValorResgateNaoTrib);
          cds.FieldByname('VALORIRRFQ').asString           := FormatFloat('##,###0.00', ValorIrrf);
          cds.FieldByname('DESCONTOEMPTMOQ').asString      := FormatFloat('##,###0.00', DescontoEmptmoRegReplan);
          cds.FieldByname('VALORLIQUIDOQ').asString        := FormatFloat('##,###0.00', (ValorResgateTrib + ValorResgateNaoTrib) - (ValorIrrf + DescontoEmptmoRegReplan));
          if (((ValorResgateTrib + ValorResgateNaoTrib) - (ValorIrrf + DescontoEmptmoRegReplan)) > 0) then begin
            cds.FieldByname('VALORLIQUIDOQ').asString        := FormatFloat('##,###0.00', (ValorResgateTrib + ValorResgateNaoTrib) - (ValorIrrf + DescontoEmptmoRegReplan));
          end else begin
            cds.FieldByname('VALORLIQUIDOQ').asString        := FormatFloat('##,###0.00', 0);
          end;
        end else begin
          cds.FieldByname('VALORRESGATETRIBQ').asString    := 'Não Elegível';
          cds.FieldByname('VALORRESGATENAOTRIBQ').asString := 'Não Elegível';
          cds.FieldByname('VALORRESGATEBRUTOQ').asString   := 'Não Elegível';
          cds.FieldByname('VALORIRRFQ').asString           := 'Não Elegível';
          cds.FieldByname('DESCONTOEMPTMOQ').asString      := 'Não Elegível';
          cds.FieldByname('VALORLIQUIDOQ').asString        := 'Não Elegível';
        end;
        //CalculaIrrf((ValorResgateTrib* vlrCotas),sOpcaoIrRegReplan,copy(edtDataBase.Text,6,4),2); // fazer valor resgate
        //ValorIrrf      := fValorIrrfREGREPLAN;
        //ValorLiquido   := ((ValorResgateTrib+ValorResgateNaoTrib)*vlrCotas)-(ValorIrrf+DescontoEmptmoRegReplan);

        //cds.FieldByname('VALORRESGATETRIBQ').asString    := FormatFloat('##,###0.00',(ValorResgateTrib * vlrCotas ));
        //cds.FieldByname('VALORRESGATENAOTRIBQ').asString := FormatFloat('##,###0.00',(ValorResgateNaoTrib * vlrCotas ));
        //cds.FieldByname('VALORRESGATEBRUTOQ').asString   := FormatFloat('##,###0.00',vlrReservaPoup * vlrCotas);
        //cds.FieldByname('VALORIRRFQ').asString           := FormatFloat('##,###0.00',ValorIrrf);
        //cds.FieldByname('DESCONTOEMPTMOQ').asString      := FormatFloat('##,###0.00',DescontoEmptmoRegReplan);
        //cds.FieldByname('VALORLIQUIDOQ').asString        := FormatFloat('##,###0.00',ValorLiquido );
        //BRUNO AZEVEDO SOL 167335 - FIM.

        //4 - AutoPatrocinio

        cds.FieldByname('SALARIOPART').asString  := FormatFloat('##,###0.00',rSalarioRegReplan);


        PercentualSalPart  :=0;
        PercentualSalPatro :=0;

        QryAux1.Close;
        QryAux1.SQL.Clear;
        QryAux1.SQL.Add(' SELECT CP.VALORBASE1, cp.idcontribuicao, con.nome ');
        QryAux1.SQL.Add('  FROM CONTRIBPREVPARTP CP, contribuicao con       ');
        QryAux1.SQL.Add('  WHERE CP.IDPESSOA = '+intTostr(iIdPessoa)         );
        QryAux1.SQL.Add('  AND CP.IDPLANOPREV = 2                          ');
        QryAux1.SQL.Add('  AND CP.Idcontribuicao = con.idcontribuicao       ');
        QryAux1.Open;

        QryAux1.First;

        while not QryAux1.eof do begin
          if qryAux1.FieldByname('IDCONTRIBUICAO').asString = '1' then begin
            PercentualSalPart  := qryAux1.FieldByname('VALORBASE1').asFloat;
          end else if qryAux1.FieldByname('IDCONTRIBUICAO').asString = '21' then begin
            PercentualSalPatro := qryAux1.FieldByname('VALORBASE1').asFloat;
          end;
          QryAux1.Next;
        end;

        PercentualSalPart  := (PercentualSalPart /100);
        PercentualSalPatro := (PercentualSalPatro/100);

        if (PercentualSalPart=0) then begin
          PercentualSalPart :=1;
        end;

        if (PercentualSalPatro=0) then begin
          PercentualSalPatro :=1;
        end;

        DefineElegibilidade_AutoPatrocinio(2);
        if (dtmRelExtratoDesligamento.lblNaoElegivelSALRegReplan.Caption = 'Elegível') then begin
          cds.FieldByname('CONTRIBPARTICIPANTE').asString := FormatFloat('##,###0.00',(rSalarioRegReplan*PercentualSalPart));
          cds.FieldByname('CONTRIBPATROCINADOR').asString := FormatFloat('##,###0.00',(rSalarioRegReplan*PercentualSalPatro));
          dtmRelExtratoDesligamento.ppLabel79.Caption := 'R$';
          dtmRelExtratoDesligamento.ppLabel80.Caption := 'R$';
        end else begin
          cds.FieldByname('CONTRIBPARTICIPANTE').asString := 'Não Elegível';
          cds.FieldByname('CONTRIBPATROCINADOR').asString := 'Não Elegível';
          dtmRelExtratoDesligamento.ppLabel79.Caption := '';
          dtmRelExtratoDesligamento.ppLabel80.Caption := '';
        end;

        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('SELECT SUM(VALORESPERADO) AS CONTRIBABERTO FROM HSTCONTRIBPREV');
        QryAux.SQL.Add('WHERE IDPESSOA     ='+intTostr(iIdPessoa));
        QryAux.SQL.Add('AND IDPLANOPREV    =2');
        QryAux.SQL.Add('AND IDPESSJUR      ='+intTostr(iIdPessJur));
        QryAux.SQL.Add('AND ((SITRECEBIMENTO = 0) OR (SITRECEBIMENTO = 1))');
        QryAux.SQL.Add('AND ((MESCOBRANCA >='+QuotedStr(copy(cds.FieldByname('DATARECISAOREGREPLAN').asString,7,4)+'/'+copy(cds.FieldByname('DATARECISAOREGREPLAN').asString,4,2))+') AND (MESCOBRANCA <='+QuotedStr(copy(edtDataBase.text,7,4)+'/'+copy(edtDataBase.text,4,2))+'))');
        QryAux.Open;

        cds.FieldByname('CONTRIBABERTAS').asString      := FormatFloat('##,###0.00',Qryaux.FieldByname('CONTRIBABERTO').asFloat);

        //DataInscricao    := Inscricao(iIdPessoa);
        //DefineElegibilidade_Portabilidade(2, DataInscricao);
        //COMENTADO AQUI - BRUNO AZEVEDO
        //DefineElegibilidade_Resgate(2);
        //DefineElegibilidade_AutoPatrocinio(2);

//        if (not BPDElegibilidade) and (not ElegibilidadeBeneficioDeRendaContinuada (2)) then
        //if (not BPDElegibilidade) then
        //begin
        //  dtmRelExtratoDesligamento.lblNaoElegivelBPDRegReplan.Caption := 'Elegível';
        //end
        //else begin
        //  dtmRelExtratoDesligamento.lblNaoElegivelBPDRegReplan.Caption := 'Não Elegível';
        //end;
      end;  // Fim RegReplan

      /////////////////////////
      ///Novo Plano////////////
      /////////////////////////

      if bNovoPLano then begin

       //Salario de Participacao
        SalarioParticipacao(iIdPessJur,iIdPessoa,74);

        b3AnosContrib               :=False;
        fValorResgateBrutoNovoPLano :=0;
        vlrCotas                    :=0;
        vlrSaldoConta               :=0;
        ValorPortadoNovoPlano       :=0;
        ValorPortadoOutroNovoPlano  :=0;
        ResgateBrutoNovoPlano       :=0;
        irrfNovoPlano               :=0;
        vlrLiquidoNovoPLano         :=0;
        ValorPatro                  :=0;

        //Cabeçalho
        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('SELECT * FROM PESSOA WHERE IDPESSOA='+intTostr(iIdPessJur));
        QryAux.Open;

        cds.FieldByname('PATROCINADORNOVOPLANO').asString := QryAux.FieldByname('RAZAOSOCIAL').Asstring;

        qryGrid.Locate('IDPLANOPREV',('74'),[]);
        cds.FieldByname('DATARECISAONOVOPLANO').asString  := qryGrid.FieldByname('DATADEMISSAO').asstring;

        QryAux1.Close;
        QryAux1.SQL.Clear;
        QryAux1.SQL.Add('SELECT INSCRICAODATA,NVL(TIPOOPCAOIR,0) as TIPOOPCAOIR FROM PARTPREVPLAN WHERE IDPESSJUR='+intTostr(iIdPessJur));
        QryAux1.SQL.Add('AND IDPESSOA='+intTostr(iIdPessoa));
        QryAux1.SQL.Add('AND IDPLANOPREV=74');

        QryAux1.Open;

        cds.FieldByname('DATAINSCRICAONOVOPLANO').asString := QryAux1.FieldByname('INSCRICAODATA').asString;
        sOpcaoIrNovoPlano                                  := QryAux1.FieldByname('TIPOOPCAOIR').asInteger;

        QryAux1.Close;
        QryAux1.SQL.Clear;
        QryAux1.SQL.Add('SELECT DATAADMISSAO FROM ELEGPATRO WHERE IDPESSJUR='+intTostr(iIdPessJur));
        QryAux1.SQL.Add('AND IDPESSOA='+intTostr(iIdPessoa));

        QryAux1.Open;

        cds.FieldByname('DATAADMISSAONOVOPLANO').asString := QryAux1.FieldByname('DATAADMISSAO').asString;

        b3AnosContrib := Tem3AnosContribuicao(iIdPessoa,74,iIdPessJur);

        //Busca o valor de Cotas do Participante
        QryCotas.Close;
        QryCotas.ParamByName('IDPESSJUR').AsInteger   := iIdPessJur;
        QryCotas.ParamByName('IDPESSOA').AsInteger    := iIdPessoa;
        QryCotas.ParamByName('IDPLANOPREV').Asstring  := '74';
        QryCotas.Open;

        vlrCotas := QryCotas.FieldByName('COTVALOR').asFloat;
        if vlrCotas = 0 then vlrCotas :=1;

        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('SELECT A.IDPESSOA,A.MATRICULA,HH.IDTIPORESERVA,');
        QryAux.SQL.Add('SUM(DECODE(HH.FLGENTRADA,1,HH.VLRCOTAS,-HH.VLRCOTAS)) AS VALORCOTAS');
        QryAux.SQL.Add('FROM');
        QryAux.SQL.Add(' ELEGPATRO A,');
        QryAux.SQL.Add(' HISTMOVRESERVA HH');
        QryAux.SQL.Add('WHERE');
        QryAux.SQL.Add('    A.IDPESSOA = HH.IDPESSOA');
        QryAux.SQL.Add('AND A.IDPESSJUR = HH.IDPESSJUR');
        QryAux.SQL.Add('AND HH.IDPLANOPREV = 74');
        QryAux.SQL.Add('AND HH.IDPESSJUR ='+ intTostr(iIdPessJur));
        QryAux.SQL.Add('AND HH.IDTIPORESERVA IN (100,101,110,111)');
        QryAux.SQL.Add('AND A.MATRICULA ='+ QuotedStr(sMatricula));
        QryAux.SQL.Add('GROUP BY A.IDPESSOA ,A.MATRICULA, HH.IDTIPORESERVA');
        QryAux.Open;

        QryAux.First;

        While Not QryAux.Eof Do begin
          vlrSaldoConta := vlrSaldoConta + QryAux.FieldByname('ValorCotas').AsFloat;

          //Valor Portado
          if (QryAux.FieldByname('IDTIPORESERVA').asString = '100') or (QryAux.FieldByname('IDTIPORESERVA').asString = '101') then begin
            ValorPortadoNovoPlano := ValorPortadoNovoPlano + QryAux.FieldByname('ValorCotas').asFloat;
          end else if (QryAux.FieldByname('IDTIPORESERVA').asString = '110') or (QryAux.FieldByname('IDTIPORESERVA').asString = '111')then begin
            ValorPortadoOutroNovoPlano := ValorPortadoOutroNovoPlano + QryAux.FieldByname('ValorCotas').asFloat;
          end;

          if (QryAux.FieldByname('IDTIPORESERVA').asString = '101') then begin
            ValorPatro := ValorPatro + QryAux.FieldByname('ValorCotas').asFloat;
          end;

          QryAux.Next;
        end;


        if (not BPDElegibilidade) then
        begin
          dtmRelExtratoDesligamento.lblNaoElegivelBPDNovoPlano.Caption := 'Elegível';
          cds.FieldByname('SALDOCONTAQ').asString     := FormatFloat('##,###0.00',vlrSaldoConta*vlrCotas);
          cds.FieldByname('VALORPREVISTOQ').asString  := FormatFloat('##,###0.00',((vlrSaldoConta*vlrCotas)/edtFatorAtuarial.Value));
        end
        else begin
          dtmRelExtratoDesligamento.lblNaoElegivelBPDNovoPlano.Caption := 'Não Elegível';
          cds.FieldByname('SALDOCONTAQ').asString     := 'Não Elegível';
          cds.FieldByname('VALORPREVISTOQ').asString  := 'Não Elegível';
        end;

        //if (vlrSaldoConta <> 0) and ( b3AnosContrib) then begin
        //  cds.FieldByname('SALDOCONTAQ').asString     := FormatFloat('##,###0.00',vlrSaldoConta*vlrCotas);
        //  cds.FieldByname('VALORPREVISTOQ').asString  := FormatFloat('##,###0.00',((vlrSaldoConta*vlrCotas)/edtFatorAtuarial.Value));
        //end else begin
        //  cds.FieldByname('SALDOCONTAQ').asString     := 'Não Elegível';
        //  cds.FieldByname('VALORPREVISTOQ').asString  := 'Não Elegível';
        //end;

        // Renato Visoni SOL 136086 Kintana 811975
        //BRUNO AZEVEDO 167335
        DataInscricao := Inscricao(iIdPessoa);
        DefineElegibilidade_Portabilidade(0, DataInscricao);
        if (dtmRelExtratoDesligamento.lblNaoElegivelPortabilidadeNovoPlano.Caption = 'Elegível') then begin
          cds.FieldByname('ValorPortadoNovoPlanoQ').asString      := FormatFloat('##,###0.00',ValorPortadoNovoPlano*vlrCotas);
          cds.FieldByname('ValorPortadoOutroNovoPlanoQ').asString := FormatFloat('##,###0.00',ValorPortadoOutroNovoPlano*vlrCotas);
          cds.FieldByname('TotalPortadoNovoPLanoQ').asString      := FormatFloat('##,###0.00',vlrSaldoConta*vlrCotas);
        end else begin
          cds.FieldByname('ValorPortadoNovoPlanoQ').asString      := 'Não Elegível';
          cds.FieldByname('ValorPortadoOutroNovoPlanoQ').asString := 'Não Elegível';
          cds.FieldByname('TotalPortadoNovoPLanoQ').asString      := 'Não Elegível';

          if (ValorPortadoOutroNovoPlano<>0) then begin
            cds.FieldByname('ValorPortadoOutroNovoPlanoQ').asString := FormatFloat('##,###0.00',ValorPortadoOutroNovoPlano*vlrCotas);
            cds.FieldByname('TotalPortadoNovoPLanoQ').asString      := FormatFloat('##,###0.00',ValorPortadoOutroNovoPlano*vlrCotas);
          end;
        end;

        {if b3AnosContrib then begin
          //Valor Portado
          cds.FieldByname('ValorPortadoNovoPlanoQ').asString      := FormatFloat('##,###0.00',ValorPortadoNovoPlano*vlrCotas);
          cds.FieldByname('ValorPortadoOutroNovoPlanoQ').asString := FormatFloat('##,###0.00',ValorPortadoOutroNovoPlano*vlrCotas);
          cds.FieldByname('TotalPortadoNovoPLanoQ').asString      := FormatFloat('##,###0.00',vlrSaldoConta*vlrCotas);
        end else begin
          cds.FieldByname('ValorPortadoNovoPlanoQ').asString      := 'Não Elegível';
          cds.FieldByname('ValorPortadoOutroNovoPlanoQ').asString := 'Não Elegível';
          cds.FieldByname('TotalPortadoNovoPLanoQ').asString      := 'Não Elegível';

          if (ValorPortadoOutroNovoPlano<>0) then begin
            cds.FieldByname('ValorPortadoOutroNovoPlanoQ').asString := FormatFloat('##,###0.00',ValorPortadoOutroNovoPlano*vlrCotas);
            cds.FieldByname('TotalPortadoNovoPLanoQ').asString      := FormatFloat('##,###0.00',ValorPortadoOutroNovoPlano*vlrCotas);
          end;
        end;  }
        // Renato Visoni SOL 136086 Kintana 811975
        
        //Resgate
        //BRUNO AZEVEDO SOL 167335 - REGRESSIVO
        if (sOpcaoIrNovoPlano = 2) then begin
          CalculaIrrf((ResgateBrutoNovoPlano*vlrCotas),sOpcaoIrNovoPlano,copy(edtDataBase.Text,6,4),74);
          irrfNovoPlano         := fValorIRRFNovoPlano;

          ResgateBrutoNovoPlano := fValorResgateBrutoNovoPLano;
          vlrLiquidoNovoPLano   := (fValorResgateBrutoNovoPLano -(irrfNovoPlano+DescontoNovoPlano));

          cds.FieldByname('ResgateBrutoNovoPlanoQ').asString := FormatFloat('##,###0.00',ResgateBrutoNovoPlano);
          cds.FieldByname('IRRFNOVOPLANOQ').asString         := FormatFloat('##,###0.00',irrfNovoPlano);
          cds.FieldByname('DESCONTONOVOPLANOQ').asString     := FormatFloat('##,###0.00',DescontoNovoPlano);
          if (vlrLiquidoNovoPLano > 0) then begin
            cds.FieldByname('VLRLIQUIDOQ').asString          := FormatFloat('##,###0.00',vlrLiquidoNovoPLano);
          end else begin
            cds.FieldByname('VLRLIQUIDOQ').asString       := FormatFloat('##,###0.00',0);
          end; 
        //BRUNO AZEVEDO SOL 167335 - PROGRESSIVO
        end else begin
          ResgateBrutoNovoPlano := ReservasResgataveisNOVOPLANO(sMatricula);

          cds.FieldByname('ResgateBrutoNovoPlanoQ').asString  := FormatFloat('##,###0.00',ResgateBrutoNovoPlano);
          cds.FieldByname('IRRFNOVOPLANOQ').asString          := FormatFloat('##,###0.00',((ResgateBrutoNovoPlano * 15)/100));
          cds.FieldByname('DESCONTONOVOPLANOQ').asString      := FormatFloat('##,###0.00',DescontoNovoPlano);
          if ((ResgateBrutoNovoPlano - ((ResgateBrutoNovoPlano * 15)/100) - (DescontoNovoPlano)) > 0) then begin
            cds.FieldByname('VLRLIQUIDOQ').asString           := FormatFloat('##,###0.00',(ResgateBrutoNovoPlano - ((ResgateBrutoNovoPlano * 15)/100) - (DescontoNovoPlano)));
          end else begin
            cds.FieldByname('VLRLIQUIDOQ').asString           := FormatFloat('##,###0.00',0);
          end;
        end;

        //4 - AutoPatrocinio
      
        PercentualSalPart  :=0;
        PercentualSalPatro :=0;

        QryAux1.Close;
        QryAux1.SQL.Clear;
        QryAux1.SQL.Add(' SELECT CP.VALORBASE1, cp.idcontribuicao, con.nome ');
        QryAux1.SQL.Add('  FROM CONTRIBPREVPARTP CP, contribuicao con       ');
        QryAux1.SQL.Add('  WHERE CP.IDPESSOA = '+intTostr(iIdPessoa)         );
        QryAux1.SQL.Add('  AND CP.IDPLANOPREV = 74                          ');
        QryAux1.SQL.Add('  AND CP.Idcontribuicao = con.idcontribuicao       ');
        QryAux1.Open;

        QryAux1.First;

        while not QryAux1.eof do begin
          if qryAux1.FieldByname('IDCONTRIBUICAO').asString = '1' then begin
            PercentualSalPart  := qryAux1.FieldByname('VALORBASE1').asFloat;
          end else if qryAux1.FieldByname('IDCONTRIBUICAO').asString = '21' then begin
            PercentualSalPatro := qryAux1.FieldByname('VALORBASE1').asFloat;
          end;
          QryAux1.Next;
        end;

        ppLabel134.Caption := floatTostr(PercentualSalPart)+  '% sobre o salário de participação';
        ppLabel137.Caption := floatTostr(PercentualSalPatro)+ '% sobre o salário de participação';

        PercentualSalPart  := (PercentualSalPart /100);
        PercentualSalPatro := (PercentualSalPatro/100);

        if (PercentualSalPart=0) then begin
          PercentualSalPart :=1;
        end;

        if (PercentualSalPatro=0) then begin
          PercentualSalPatro :=1;
        end;

        //BRUNO AZEVEDO SOL 167335
        DefineElegibilidade_AutoPatrocinio(0);
        if (dtmRelExtratoDesligamento.lblNaoElegivelSALNovoPlano.Caption = 'Elegível') then begin
          dCusteioAdm   := CarregaIndiceAdmRisco('TAB_NOVOPLANO', 'DES_ADM_PATR');
          dCusteioRisco := CarregaIndiceAdmRisco('TAB_NOVOPLANO', 'BRISCO_PATROC');

          dtmRelExtratoDesligamento.ppLabel140.Caption := FloatToStr(dCusteioAdm * 100) + '% Incidente sobre a contribuição referente à parte  participante e a parte patrocinador.';
          dtmRelExtratoDesligamento.ppLabel143.Caption := FloatToStr(dCusteioRisco * 100) + '% Incidente sobre o salário de participação.';

          cds.FieldByname('SALPARTNOVOPLANO').asString       := FormatFloat('##,###0.00',rSalarioNovoPlano);
          cds.FieldByname('CONTRIBPARTNOVOPLANO').asString   := FormatFloat('##,###0.00',rSalarioNovoPlano*PercentualSalPart); // X % sobre o salario de participação
          cds.FieldByname('CONTRIBPATRONOVOPLANO').asString  := FormatFloat('##,###0.00',rSalarioNovoPlano*PercentualSalPatro); // X % sobre o salario de participação
          cds.FieldByname('CUSTEIOADMNOVOPLANO').asString    := FormatFloat('##,###0.00',(((rSalarioNovoPlano*PercentualSalPart) +(rSalarioNovoPlano*PercentualSalPatro))*dCusteioAdm)); //BRUNO AZEVEDO SOL 167335
          cds.FieldByname('CUSTEIORISCONOVOPLANO').asString  := FormatFloat('##,###0.00',(rSalarioNovoPlano*dCusteioRisco)); //BRUNO AZEVEDO SOL 167335
          dtmRelExtratoDesligamento.ppLabel139.Caption := 'R$';
          dtmRelExtratoDesligamento.ppLabel142.Caption := 'R$';
          dtmRelExtratoDesligamento.ppLabel136.Caption := 'R$';
          dtmRelExtratoDesligamento.ppLabel133.Caption := 'R$';
        end else begin
          cds.FieldByname('SALPARTNOVOPLANO').asString       := 'Não Elegível';
          cds.FieldByname('CONTRIBPARTNOVOPLANO').asString   := 'Não Elegível';
          cds.FieldByname('CONTRIBPATRONOVOPLANO').asString  := 'Não Elegível';
          cds.FieldByname('CUSTEIOADMNOVOPLANO').asString    := 'Não Elegível';
          cds.FieldByname('CUSTEIORISCONOVOPLANO').asString  := 'Não Elegível';
          dtmRelExtratoDesligamento.ppLabel139.Caption := '';
          dtmRelExtratoDesligamento.ppLabel142.Caption := '';
          dtmRelExtratoDesligamento.ppLabel136.Caption := '';
          dtmRelExtratoDesligamento.ppLabel133.Caption := '';
        end;

        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('SELECT SUM(VALORESPERADO) AS CONTRIBABERTO FROM HSTCONTRIBPREV');
        QryAux.SQL.Add('WHERE IDPESSOA     ='+intTostr(iIdPessoa));
        QryAux.SQL.Add('AND IDPLANOPREV    =74');
        QryAux.SQL.Add('AND IDPESSJUR      ='+intTostr(iIdPessJur));
        QryAux.SQL.Add('AND ((SITRECEBIMENTO = 0) OR (SITRECEBIMENTO = 1))');
        QryAux.SQL.Add('AND ((MESCOBRANCA >='+QuotedStr(copy(cds.FieldByname('DATARECISAONOVOPLANO').asString,7,4)+'/'+copy(cds.FieldByname('DATARECISAONOVOPLANO').asString,4,2))+') AND (MESCOBRANCA <='+QuotedStr(copy(edtDataBase.text,7,4)+'/'+copy(edtDataBase.text,4,2))+'))');

        QryAux.Open;

        cds.FieldByname('CONTRIBABERTONOVOPLANO').asString := FormatFloat('##,###0.00',QryAux.FieldByname('CONTRIBABERTO').asFloat);

        //DataInscricao := Inscricao(iIdPessoa);
        //DefineElegibilidade_Portabilidade(0, DataInscricao);
        DefineElegibilidade_Resgate(0);
        //DefineElegibilidade_AutoPatrocinio(0);

//        if (not BPDElegibilidade) and (not ElegibilidadeBeneficioDeRendaContinuada (0)) then
        //if (not BPDElegibilidade) then
        //begin
        //  dtmRelExtratoDesligamento.lblNaoElegivelBPDNovoPlano.Caption := 'Elegível';
        //end
        //else begin
        //  dtmRelExtratoDesligamento.lblNaoElegivelBPDNovoPlano.Caption := 'Não Elegível';
        //end;

      end; // Fim NovoPLano

      /////////////////////////
      ///REB//////////////////
      ///////////////////////

      if bReb then begin

        //Salario de Participacao
        SalarioParticipacao(iIdPessJur,iIdPessoa,66);

        vlrCotas        := 0;
        b3AnosContrib   := False;
        vlrCusteiAdmReb := 0;
        vlrPortadoReb   := 0;

        //Busca o valor de Cotas do Participante
        QryCotas.Close;
        QryCotas.ParamByName('IDPESSJUR').AsInteger   := iIdPessJur;
        QryCotas.ParamByName('IDPESSOA').AsInteger    := iIdPessoa;
        QryCotas.ParamByName('IDPLANOPREV').Asstring  := '66';
        QryCotas.Open;

        vlrCotas := QryCotas.FieldByName('COTVALOR').asFloat;
        if vlrCotas = 0 then vlrCotas :=1;

        cds.FieldByname('PATROREB').asInteger := iIdPessJur;

        qryGrid.Locate('IDPLANOPREV',('66'),[]);
        cds.FieldByname('DATARECISAOREB').asstring := qryGrid.FieldByname('DATADEMISSAO').asstring;

        QryAux1.Close;
        QryAux1.SQL.Clear;
        QryAux1.SQL.Add('SELECT INSCRICAODATA,NVL(TIPOOPCAOIR,0) as TIPOOPCAOIR FROM PARTPREVPLAN WHERE IDPESSJUR='+intTostr(iIdPessJur));
        QryAux1.SQL.Add('AND IDPESSOA='+intTostr(iIdPessoa));
        QryAux1.SQL.Add('AND IDPLANOPREV=66');

        QryAux1.Open;

        cds.FieldByname('DATAINSCRICAOREB').asString := QryAux1.fieldByname('INSCRICAODATA').asString;
        sOpcaoIrREB                                  := QryAux1.FieldByname('TIPOOPCAOIR').asInteger;

        QryAux1.Close;
        QryAux1.SQL.Clear;
        QryAux1.SQL.Add('SELECT DATAADMISSAO FROM ELEGPATRO WHERE IDPESSJUR='+intTostr(iIdPessJur));
        QryAux1.SQL.Add('AND IDPESSOA='+intTostr(iIdPessoa));

        QryAux1.Open;

        cds.FieldByname('DATAADMISSAOREB').asString := QryAux1.FieldByname('DATAADMISSAO').asString;

        QryAux.Close;
        QryAux.SQL.Clear;
        QryAux.SQL.Add('SELECT EL.IDPESSOA, EL.MATRICULA,HS.IDPLANOPREV');
        QryAux.SQL.Add(',SUM(DECODE(HS.IDTIPORESERVA , 51,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             , 52,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             ,53,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             ,55,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             ,79,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             ,117,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             ,134,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             , 0)) AS VLRCOTAS_EMPRE');
        QryAux.SQL.Add(',SUM(DECODE(HS.IDTIPORESERVA , 59,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             ,60,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             ,61,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             ,62,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             ,167,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             ,170,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                             , 0)) AS VLRCOTAS_PATRO,  PP.DTINICIOINSC');
        QryAux.SQL.Add('FROM ELEGPATRO EL, HISTMOVRESERVA HS,PARTPREVPLAN PP');
        QryAux.SQL.Add('WHERE EL.IDPESSOA = HS.IDPESSOA');
        QryAux.SQL.Add('AND EL.IDPESSJUR = HS.IDPESSJUR');
        QryAux.SQL.Add('AND HS.IDPLANOPREV = PP.IDPLANOPREV');
        QryAux.SQL.Add('AND EL.IDPESSJUR = PP.IDPESSJUR');
        QryAux.SQL.Add('AND EL.IDPESSOA = PP.IDPESSOA');
        QryAux.SQL.Add('AND EL.MATRICULA ='+QuotedStr(sMatricula));
        QryAux.SQL.Add('AND HS.IDPLANOPREV = 66');
        QryAux.SQL.Add('GROUP BY EL.IDPESSOA,EL.MATRICULA,HS.IDPLANOPREV,PP.DTINICIOINSC');

        QryAux.Open;

        QryAux.First;

        While not QryAux.eof Do begin
          vlrSaldoConta   := vlrSaldoConta   + (QryAux.FieldByname('VLRCOTAS_EMPRE').AsFloat + QryAux.FieldByname('VLRCOTAS_PATRO').AsFloat);
          vlrCusteiAdmReb := vlrCusteiAdmReb + QryAux.FieldByname('VLRCOTAS_PATRO').AsFloat;
          QryAux.Next;
        end;

        b3AnosContrib := Tem3AnosContribuicao(iIdPessoa,2,iIdPessJur);

        // BPD
        if (not BPDElegibilidade) then
        begin
          dtmRelExtratoDesligamento.lblNaoElegivelBPDReb.Caption := 'Elegível';
          cds.FieldByname('SALDOCONTAREBQ').asstring    := FormatFloat('##,###0.00',(vlrSaldoConta*vlrCotas));
          cds.FieldByname('VALORPREVISTOREBQ').asstring := FormatFloat('##,###0.00',((vlrSaldoConta*vlrCotas)/edtFatorAtuarial.Value));
        end
        else begin
          dtmRelExtratoDesligamento.lblNaoElegivelBPDReb.Caption := 'Não Elegível';
          cds.FieldByname('SALDOCONTAREBQ').asstring    := 'Não Elegível';
          cds.FieldByname('VALORPREVISTOREBQ').asstring := 'Não Elegível';
        end;

        //if b3AnosContrib then begin
        //  cds.FieldByname('SALDOCONTAREBQ').asstring    := FormatFloat('##,###0.00',(vlrSaldoConta*vlrCotas));
        //  cds.FieldByname('VALORPREVISTOREBQ').asstring := FormatFloat('##,###0.00',((vlrSaldoConta*vlrCotas)/edtFatorAtuarial.Value));
        //end else begin
        //  cds.FieldByname('SALDOCONTAREBQ').asstring    := 'Não Elegível';
        //  cds.FieldByname('VALORPREVISTOREBQ').asstring := 'Não Elegível';
        //end;

        //POrtabilidade
        //VALOR A SER PORTADO
        QryAux.Close;
        QryAux.SQL.Clear;

        QryAux.SQL.Add('SELECT EL.IDPESSOA, EL.MATRICULA,HS.IDPLANOPREV');
        QryAux.SQL.Add(',SUM(DECODE(HS.IDTIPORESERVA, 51,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                            , 52,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                            ,53,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                            ,55,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                            ,79,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                            ,59,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                            ,60,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                            ,61,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                            ,62,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                            ,167,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                            ,170,DECODE(HS.FLGENTRADA,1,HS.VLRCOTAS,-HS.VLRCOTAS)');
        QryAux.SQL.Add('                            ,0)) AS VLRPORTADO, PP.DTINICIOINSC');
        QryAux.SQL.Add('FROM ELEGPATRO EL, HISTMOVRESERVA HS,PARTPREVPLAN PP');
        QryAux.SQL.Add('WHERE EL.IDPESSOA = HS.IDPESSOA');
        QryAux.SQL.Add('AND EL.IDPESSJUR = HS.IDPESSJUR');
        QryAux.SQL.Add('AND HS.IDPLANOPREV = PP.IDPLANOPREV');
        QryAux.SQL.Add('AND EL.IDPESSJUR = PP.IDPESSJUR');
        QryAux.SQL.Add('AND EL.IDPESSOA = PP.IDPESSOA');
        QryAux.SQL.Add('AND EL.MATRICULA ='+ QuotedStr(sMatricula));
        QryAux.SQL.Add('AND HS.IDPLANOPREV = 66');
        QryAux.SQL.Add('GROUP BY EL.IDPESSOA,EL.MATRICULA,HS.IDPLANOPREV,PP.DTINICIOINSC');
        QryAux.Open;

        vlrPortadoReb                                 := QryAux.FieldByName('VLRPORTADO').asFloat;


        //if b3AnosContrib then begin
        //  cds.FieldByname('VALORPORTADOREBQ').asString  := FormatFloat('##,###0.00',(QryAux.FieldByName('VLRPORTADO').asFloat*vlrCotas));
        //end else begin
        //  cds.FieldByname('VALORPORTADOREBQ').asString  := 'Não Elegível';
        //end;
        //VALOR PORTADO OUTRO PLANO

        QryAux.Close;
        QryAux.SQL.Clear;

        QryAux.SQL.Add('SELECT SUM(HS.VLRCOTAS) AS VALOROUTROPLANO');
        QryAux.SQL.Add('FROM ELEGPATRO EL, HISTMOVRESERVA HS,PARTPREVPLAN PP');
        QryAux.SQL.Add('WHERE EL.IDPESSOA = HS.IDPESSOA');
        QryAux.SQL.Add('AND EL.IDPESSJUR = HS.IDPESSJUR');
        QryAux.SQL.Add('AND HS.IDPLANOPREV = PP.IDPLANOPREV');
        QryAux.SQL.Add('AND EL.IDPESSJUR = PP.IDPESSJUR');
        QryAux.SQL.Add('AND EL.IDPESSOA = PP.IDPESSOA');
        QryAux.SQL.Add('AND EL.MATRICULA ='+ QuotedStr(sMatricula));
        QryAux.SQL.Add('AND HS.IDPLANOPREV = 66');
        QryAux.SQL.Add('AND HS.IDTIPORESERVA IN (''117'',''134'')');
        QryAux.Open;

        DataInscricao := Inscricao(iIdPessoa);
        DefineElegibilidade_Portabilidade(1, DataInscricao);
        if (dtmRelExtratoDesligamento.lblNaoElegivelPortabilidadeReb.Caption = 'Elegível') then begin
          cds.FieldByname('VALORPORTADOOUTROREBQ').asString := FormatFloat('##,###0.00',(QryAux.FieldByName('VALOROUTROPLANO').asFloat*vlrCotas));
          cds.FieldByname('VALORPORTADOREBQ').asString      := FormatFloat('##,###0.00',(vlrPortadoReb));
          cds.FieldByname('TOTALPORTADOREBQ').asString      := FormatFloat('##,###0.00',((vlrPortadoReb) + (QryAux.FieldByName('VALOROUTROPLANO').asFloat*vlrCotas)));
        end else begin
          cds.FieldByname('VALORPORTADOOUTROREBQ').asString :='Não Elegível';
          cds.FieldByname('VALORPORTADOREBQ').asString      :='Não Elegível';
          cds.FieldByname('TOTALPORTADOREBQ').asString      :='Não Elegível';

          if QryAux.FieldByName('VALOROUTROPLANO').asFloat > 0 then begin
            cds.FieldByname('VALORPORTADOOUTROREBQ').asString := FormatFloat('##,###0.00',(QryAux.FieldByName('VALOROUTROPLANO').asFloat*vlrCotas));
          end;
        end;

        // Renato Visoni SOL 136086 Kintana 811975
        {if (b3AnosContrib) then begin
          cds.FieldByname('VALORPORTADOOUTROREBQ').asString := FormatFloat('##,###0.00',(QryAux.FieldByName('VALOROUTROPLANO').asFloat*vlrCotas));
          cds.FieldByname('TOTALPORTADOREBQ').asString      := FormatFloat('##,###0.00',((vlrPortadoReb + QryAux.FieldByName('VALOROUTROPLANO').asFloat)*vlrCotas));
        end else begin
          cds.FieldByname('VALORPORTADOOUTROREBQ').asString :='Não Elegível';
          cds.FieldByname('TOTALPORTADOREBQ').asString      :='Não Elegível';

          if QryAux.FieldByName('VALOROUTROPLANO').asFloat > 0 then begin
            cds.FieldByname('VALORPORTADOOUTROREBQ').asString := FormatFloat('##,###0.00',(QryAux.FieldByName('VALOROUTROPLANO').asFloat*vlrCotas));
            cds.FieldByname('TOTALPORTADOREBQ').asString      := FormatFloat('##,###0.00',((QryAux.FieldByName('VALOROUTROPLANO').asFloat)*vlrCotas));
          end;
        end;  }
        // Renato Visoni SOL 136086 Kintana 811975

        //RESGATE
        //BRUNO AZEVEDO SOL 167335 - REGRESSIVO
        if (sOpcaoIrREB = 2) then begin
          CalculaIrrf(0,sOpcaoIrREB,copy(edtDataBase.Text,6,4),66);
          cds.FieldByname('VLRIRRFREBQ').asString          := FormatFloat('##,###0.00',fValorIrrfREB);
          cds.FieldByname('VLRRESGATEBRUTOREBQ').asString  := FormatFloat('##,###0.00',fResgateBrutoREB);
          cds.FieldByname('DESCONTOREBQ').asString         := FormatFloat('##,###0.00',fDESCONTOREBQ);
          if ((fResgateBrutoREB - (fValorIrrfREB+fDESCONTOREBQ)) > 0) then begin
            cds.FieldByname('VLRLIQUIDOREBQ').asString     := FormatFloat('##,###0.00',fResgateBrutoREB - (fValorIrrfREB+fDESCONTOREBQ));
          end else begin
            cds.FieldByname('VLRLIQUIDOREBQ').asString     := FormatFloat('##,###0.00',0);
          end;
        //BRUNO AZEVEDO SOL 167335 - PROGRESSIVO
        end else begin
          fResgateBrutoREB := ReservasResgataveisREB(sMatricula);

          cds.FieldByname('VLRRESGATEBRUTOREBQ').asString  := FormatFloat('##,###0.00',fResgateBrutoREB);
          cds.FieldByname('VLRIRRFREBQ').asString          := FormatFloat('##,###0.00',((fResgateBrutoREB * 15)/100));
          if ((fResgateBrutoREB - (fValorIrrfREB+fDESCONTOREBQ)) > 0) then begin
            cds.FieldByname('VLRLIQUIDOREBQ').asString     := FormatFloat('##,###0.00',fResgateBrutoREB - (fValorIrrfREB+fDESCONTOREBQ));
          end else begin
            cds.FieldByname('VLRLIQUIDOREBQ').asString     := FormatFloat('##,###0.00',0);
          end;
          cds.FieldByname('VLRLIQUIDOREBQ').asString       := FormatFloat('##,###0.00',(fResgateBrutoREB - ((fResgateBrutoREB * 15)/100) - (fDESCONTOREBQ)));
          // Thiago Melo SOL 206337 Kintana 1996861
          cds.FieldByname('DESCONTOREBQ').asString         := FormatFloat('##,###0.00',fDESCONTOREBQ);
          // Thiago Melo SOL 206337 Kintana 1996861
        end;

        //AutoPatrocinio


        PercentualSalPart  :=0;
        PercentualSalPatro :=0;

        QryAux1.Close;
        QryAux1.SQL.Clear;
        QryAux1.SQL.Add(' SELECT CP.VALORBASE1, cp.idcontribuicao, con.nome ');
        QryAux1.SQL.Add('  FROM CONTRIBPREVPARTP CP, contribuicao con       ');
        QryAux1.SQL.Add('  WHERE CP.IDPESSOA = '+intTostr(iIdPessoa)         );
        QryAux1.SQL.Add('  AND CP.IDPLANOPREV = 66                          ');
        QryAux1.SQL.Add('  AND CP.Idcontribuicao = con.idcontribuicao       ');
        QryAux1.Open;

        QryAux1.First;

        while not QryAux1.eof do begin
          if qryAux1.FieldByname('IDCONTRIBUICAO').asString = '1' then begin
            PercentualSalPart  := qryAux1.FieldByname('VALORBASE1').asFloat;
          end else if qryAux1.FieldByname('IDCONTRIBUICAO').asString = '21' then begin
            PercentualSalPatro := qryAux1.FieldByname('VALORBASE1').asFloat;
          end;
          QryAux1.Next;
        end;

        ppLabel201.Caption := floatTostr(PercentualSalPart)+  '% sobre o salário de participação';
        ppLabel204.Caption := floatTostr(PercentualSalPatro)+ '% sobre o salário de participação';

        PercentualSalPart  := (PercentualSalPart /100);
        PercentualSalPatro := (PercentualSalPatro/100);

        if (PercentualSalPart=0) then begin
          PercentualSalPart :=1;
        end;

        if (PercentualSalPatro=0) then begin
          PercentualSalPatro :=1;
        end;

        //BRUNO AZEVEDO SOL 167335
        DefineElegibilidade_AutoPatrocinio(1);
        if (dtmRelExtratoDesligamento.lblNaoElegivelSALREB.Caption = 'Elegível') then begin
          dCusteioAdm   := CarregaIndiceAdmRisco('TAB_REB_2002CEF', 'DES_ADM_PATR');
          dCusteioRisco := CarregaIndiceAdmRisco('TAB_REB_2002CEF', 'BRISCO_PATROC');

          dtmRelExtratoDesligamento.ppLabel207.Caption := FloatToStr(dCusteioAdm * 100) + '% Incidente sobre a contribuição referente à parte  participante e a parte patrocinador.';
          dtmRelExtratoDesligamento.ppLabel210.Caption := FloatToStr(dCusteioRisco * 100) + '% Incidente sobre o salário de participação.';

          cds.FieldByname('SALARIOPARTICIPACAOREB').asString := FormatFloat('##,###0.00',rSalarioREB);
          cds.FieldByname('CONTRIBPARTREB').asString         := FormatFloat('##,###0.00',rSalarioREB*PercentualSalPart); //X% sobre salario de Participação
          cds.FieldByname('CONTRIBPATROREB').asString        := FormatFloat('##,###0.00',rSalarioREB*PercentualSalPatro); //X% sobre salario de Participação
          cds.FieldByname('CUSTEIOADMREB').asString          := FormatFloat('##,###0.00',(((rSalarioREB*PercentualSalPart) + (rSalarioREB*PercentualSalPatro))*dCusteioAdm)); //BRUNO AZEVEDO SOL 167335
          cds.FieldByname('CUSTEIORISCOREB').asString        := FormatFloat('##,###0.00',(rSalarioREB*(dCusteioRisco*2)));  //BRUNO AZEVEDO SOL 167335
          dtmRelExtratoDesligamento.ppLabel206.Caption := 'R$';
          dtmRelExtratoDesligamento.ppLabel209.Caption := 'R$';
          dtmRelExtratoDesligamento.ppLabel203.Caption := 'R$';
          dtmRelExtratoDesligamento.ppLabel200.Caption := 'R$';
        end else begin
          cds.FieldByname('SALARIOPARTICIPACAOREB').asString := 'Não Elegível';
          cds.FieldByname('CONTRIBPARTREB').asString         := 'Não Elegível';
          cds.FieldByname('CONTRIBPATROREB').asString        := 'Não Elegível';
          cds.FieldByname('CUSTEIOADMREB').asString          := 'Não Elegível';
          cds.FieldByname('CUSTEIORISCOREB').asString        := 'Não Elegível';
          dtmRelExtratoDesligamento.ppLabel206.Caption := '';
          dtmRelExtratoDesligamento.ppLabel209.Caption := '';
          dtmRelExtratoDesligamento.ppLabel203.Caption := '';
          dtmRelExtratoDesligamento.ppLabel200.Caption := '';
        end;

        QryAux.Close;
        QryAux.SQL.Clear;  
        QryAux.SQL.Add('SELECT SUM(VALORESPERADO) AS CONTRIBABERTO FROM HSTCONTRIBPREV');
        QryAux.SQL.Add('WHERE IDPESSOA     ='+intTostr(iIdPessoa));
        QryAux.SQL.Add('AND IDPLANOPREV    =66');
        QryAux.SQL.Add('AND IDPESSJUR      ='+intTostr(iIdPessJur));
        QryAux.SQL.Add('AND ((SITRECEBIMENTO = 0) OR (SITRECEBIMENTO = 1))');
        QryAux.SQL.Add('AND ((MESCOBRANCA >='+QuotedStr(copy(cds.FieldByname('DATARECISAOREB').asString,7,4)+'/'+copy(cds.FieldByname('DATARECISAOREB').asString,4,2))+') AND (MESCOBRANCA <='+QuotedStr(copy(edtDataBase.text,7,4)+'/'+copy(edtDataBase.text,4,2))+'))');

        QryAux.Open;

        cds.FieldByname('CONTRIBABERTOREB').asString := FormatFloat('##,###0.00',QryAux.FieldByname('CONTRIBABERTO').asFloat);

        //DataInscricao := Inscricao(iIdPessoa);
        //DefineElegibilidade_Portabilidade(1, DataInscricao);
        DefineElegibilidade_Resgate(1);
        //DefineElegibilidade_AutoPatrocinio(1);

//        if (not BPDElegibilidade) and (not ElegibilidadeBeneficioDeRendaContinuada (1)) then
        //if (not BPDElegibilidade) then
        //begin
        //  dtmRelExtratoDesligamento.lblNaoElegivelBPDReb.Caption := 'Elegível';
        //end
        //else begin
        //  dtmRelExtratoDesligamento.lblNaoElegivelBPDReb.Caption := 'Não Elegível';
        //end;
      end; // Fim Reb

     cds.Post;

  end;


  finally
    FreeAndNil(CtrlExtratoDesligamento);
  end;


end;

function TfrmPExtratoDesligamento.Tem3AnosContribuicao(idPessoa,
  idPLanoPrev,idpessJur: Integer): Boolean;
begin

  //Renato Visoni SOL 140376 Kintana 877601
  {
  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add('SELECT MAX(TO_DATE(MESREFERENCIA,''YYYY/MM'')) - MIN(TO_DATE(MESREFERENCIA,''YYYY/MM'')) AS QNTDIAS FROM HSTCONTRIBPREV');
  QryAux.SQL.Add('WHERE IDPESSOA     ='+intTostr(idPessoa));
  //QryAux.SQL.Add('AND IDPLANOPREV    ='+intTostr(idPlanoPrev));
  QryAux.SQL.Add('AND IDPESSJUR      ='+intTostr(idPessJur));
  QryAux.SQL.Add('AND MESREFERENCIA  NOT LIKE ''%/13'' ');
  QryAux.Open;

  Result := (QryAux.FieldByname('QNTDIAS').asInteger >= 1095); // 1095 dias = 3 anos
  }
  QryAux.Close;
  QryAux.SQL.Clear;

//  Thiago Melo SOL 167335
//  QryAux.SQL.Add('SELECT MESCOBRANCA FROM HSTCONTRIBPREV');
  QryAux.SQL.Add('SELECT MESREFERENCIA FROM HSTCONTRIBPREV');
//  Thiago Melo SOL 167335

  QryAux.SQL.Add('WHERE IDPESSOA     ='+intTostr(idPessoa));
  QryAux.SQL.Add(' AND IDPESSJUR      ='+intTostr(idPessJur));
  QryAux.SQL.Add(' AND SITRECEBIMENTO = 2');
  QryAux.SQL.Add(' AND MESCOBRANCA  NOT LIKE ''%/13'' ');

//  Thiago Melo SOL 167335
//  QryAux.SQL.Add(' GROUP BY MESCOBRANCA');
  QryAux.SQL.Add(' GROUP BY MESREFERENCIA');
//  Thiago Melo SOL 167335

  QryAux.Open;

  Result := (QryAux.RecordCount >= 36); // 1095 dias = 3 anos

  //Renato Visoni SOL 140376 Kintana 877601
end;

procedure TfrmPExtratoDesligamento.CalculaIrrf(ValorResgate: Double;
  TipoIrrf: Integer; Ano : String ; iPLano : Integer);
var sErro : String;
    SP_PROC : TStoredProc;
    iReb,iNovoPLano : Integer;


begin
  sErro :='';
  try
    if (iPLano = 2) then begin  // Reg Replan - Só pode ser Regressiva
      fValorResgateBrutoREGREPLAN := (ValorResgate);
      fValorIrrfREGREPLAN         := (ValorResgate * 15)/100;

    end else begin  // Regressivo TIPOOPACAOIR = 2

      iReb        :=0;
      iNovoPLano  :=0;

      SP_PROC := TStoredProc.Create(Application);
      SP_PROC.DatabaseName  := 'BaseDados';

      SP_PROC.StoredProcName := 'PCK_CTB_CALC_PRAZOACUMULACAO.PR_CALC_PRAZO_ACUMULACAO';

      SP_PROC.Params.CreateParam(ftInteger,   'inIDPessJur',         ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inIDPessoa',          ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inlistabenef',        ptinput);

      SP_PROC.Params.CreateParam(ftInteger,   'inREB',               ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inNOVOPLANO',         ptinput);
      SP_PROC.Params.CreateParam(ftDate,      'inDataPrevista',      ptinput);
      SP_PROC.Params.CreateParam(ftString ,   'inTipoOpcaoIR',       ptinput);
      //BRUNO AZEVEDO SOL 167335
      SP_PROC.Params.CreateParam(ftString ,   'inMatricula',         ptinput);
      SP_PROC.Params.CreateParam(ftString,    'OutERRO',             ptOutput);

      // 0 FALSE
      // 1 TRUE

      if iPLano = 66 then begin
        iReb        :=1;
        iNovoPLano  :=0;
      end else if iPLano = 74 then begin
        iReb        :=0;
        iNovoPLano  :=1;
      end;

      SP_PROC.parambyName('inIDPessJur').asInteger      := iidPessJur;
      SP_PROC.parambyName('inIDPessoa').asInteger       := iidPessoa;
      SP_PROC.parambyName('inlistabenef').Clear;
      SP_PROC.parambyName('inREB').asInteger            := iReb;
      SP_PROC.parambyName('inNOVOPLANO').asInteger      := iNovoPLano;
      SP_PROC.parambyName('inDataPrevista').Clear;

      if TipoIrrf = 2 then begin
        SP_PROC.parambyName('inTipoOpcaoIR').asString   := 'R';
      end else begin
        SP_PROC.parambyName('inTipoOpcaoIR').asString   := 'P';
      end;

      //BRUNO AZEVEDO SOL 167335
      SP_PROC.parambyName('inMatricula').asString       := sMatricula;

      SP_PROC.Prepare;
      SP_PROC.ExecProc;

     if SP_PROC.parambyName('OutERRO').asString <> 'OK' then begin
       MsgDlg('Erro ao calcular IRRF   -  ' + SP_PROC.parambyName('OutERRO').asString, 'Aviso', mtInformation, [mbOk], 0);
     end;

     QryAux1.Close;
     QryAux1.SQL.Clear;

     QryAux1.SQL.Add(' SELECT IDPESSJUR, ');
     QryAux1.SQL.Add('  IDPESSOA,        ');
     QryAux1.SQL.Add('  IDPLANOPREV,     ');
     QryAux1.SQL.Add('  VLRCOTA,         ');
     QryAux1.SQL.Add('  VLRVALOR,        ');
     QryAux1.SQL.Add('  PERCENTUALIR,    ');
     QryAux1.SQL.Add('  INDICE,          ');
     QryAux1.SQL.Add('  DESCRICAOFAIXA   ');
     QryAux1.SQL.Add(' FROM PRAZOACUMULACAO ');
     QryAux1.SQL.Add(' WHERE IDPESSJUR =' +intTostr(iidPessJur));
     QryAux1.SQL.Add('  AND IDPESSOA ='   +intTostr(iidPessoa));
     QryAux1.SQL.Add('  AND IDPLANOPREV ='+intTostr(iPLano));

     QryAux1.open;

     QryAux1.First;
     While not QryAux1.eof do begin
       if iPLano = 74 then begin
         fValorResgateBrutoNovoPLano := fValorResgateBrutoNovoPLano + QryAux1.FieldByname('VLRVALOR').asFloat;
         if (TipoIrrf = 1) then begin 
           fValorIrrfNOVOPLANO       := fValorIrrfNOVOPLANO + ((QryAux1.FieldByname('VLRVALOR').asFloat * 15)/100)
         end else begin
           fValorIrrfNOVOPLANO       := fValorIrrfNOVOPLANO + (QryAux1.FieldByname('VLRVALOR').asFloat * QryAux1.FieldByname('PERCENTUALIR').asFloat)/100;
         end;
       end else if iPLano = 66 then begin
         fResgateBrutoREB            := fResgateBrutoREB + QryAux1.FieldByname('VLRVALOR').asFloat;
         if (TipoIrrf = 1) then begin
           fValorIrrfREB             := fValorIrrfREB    + ((QryAux1.FieldByname('VLRVALOR').asFloat*15)/100);
         end else begin
           fValorIrrfREB             := fValorIrrfREB    + (QryAux1.FieldByname('VLRVALOR').asFloat * QryAux1.FieldByname('PERCENTUALIR').asFloat)/100;
         end;
       end;
       QryAux1.Next;
    end;

  end;
  except
    fValorResgateBrutoNovoPLano :=0;
    fValorIrrfNOVOPLANO         :=0;
    fResgateBrutoREB            :=0;
    fValorIrrfREB               :=0;
    fValorResgateBrutoREGREPLAN :=0;
    fValorIrrfREGREPLAN         :=0;

  end;



end;

procedure TfrmPExtratoDesligamento.Button1Click(Sender: TObject);
var SP_PROC : TStoredProc;

begin
  inherited;

      SP_PROC                := TStoredProc.Create(Application);
      SP_PROC.DatabaseName   := 'BaseDados';

      SP_PROC.StoredProcName := 'PCK_CTB_CALC_PRAZOACUMULACAO.PR_CALC_PRAZO_ACUMULACAO';

      SP_PROC.Params.CreateParam(ftInteger,   'inIDPessJur',         ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inIDPessoa',          ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inlistabenef',        ptinput);

      SP_PROC.Params.CreateParam(ftInteger,   'inREB',               ptinput);
      SP_PROC.Params.CreateParam(ftInteger,   'inNOVOPLANO',         ptinput);
      SP_PROC.Params.CreateParam(ftDate,      'inDataPrevista',      ptinput);
      SP_PROC.Params.CreateParam(ftString ,   'inTipoOpcaoIR',       ptinput);
      SP_PROC.Params.CreateParam(ftString,    'OutERRO',             ptOutput);

      // 0 FALSE
      // 1 TRUE

      SP_PROC.parambyName('inIDPessJur').asInteger  := 1;
      SP_PROC.parambyName('inIDPessoa').asInteger   := 946525;
      SP_PROC.parambyName('inlistabenef').Clear;
      SP_PROC.parambyName('inREB').asInteger        := 1;
      SP_PROC.parambyName('inNOVOPLANO').asInteger  := 0;
      SP_PROC.parambyName('inDataPrevista').Clear;
      SP_PROC.parambyName('inTipoOpcaoIR').asString := 'P';

      SP_PROC.Prepare;
      SP_PROC.ExecProc;

end;

procedure TfrmPExtratoDesligamento.DividaEmprestimo(pIdPessoa : String);
var sContratoEmptmo : String;
    rDivida         : Real;
    iPlanoDivida    : Integer;
    rContrato       : TDadosContrato;
    vLista          : TListaItem;
    sArq            : String;
    i               : Integer;
begin

   Application.CreateForm(TdtmEmptmo,dtmEmptmo);
   Application.CreateForm(TdtmLookEmptmo,dtmLookEmptmo);
   Application.CreateForm(TdtmCalcEmptmo,dtmCalcEmptmo);

   sContratoEmptmo         := '';
   DescontoEmptmoRegReplan := 0;
   DescontoNovoPlano       := 0;
   fDESCONTOREBQ           := 0;
   rDivida                 := 0;
   i                       := 0;

   QryAux1.Close;
   QryAux1.SQL.Clear;
   QryAux1.SQL.Add(' SELECT IDCONTRATOEMPTMO FROM CONTRATOEMPTMO ');
   QryAux1.SQL.Add(' WHERE IDPESSOA =' + pIdPessoa);
   QryAux1.SQL.Add(' AND FLGSITUACAO IN (''A'',''E'')');

   QryAux1.open;

   QryAux1.First;

   while not QryAux1.eof do begin
     Sel(QryAux1.FieldByname('IDCONTRATOEMPTMO').asFloat);
     PreencheDadosContrato(qry, rContrato);

     if (CalcEmptmo.CalculaItensQuitacaoNOVA(rContrato,
                                              3,                      
                                              edtDataBase.Date,
                                              -1,
                                              0,
                                              vLista,
                                              True,
                                              True,
                                              False,
                                              sArq
                                              ))
     then begin
       for i := 0 to High(vLista) do begin
         if (vLista[i].FlgCentraliza = 1) or (vLista[i].FlgDestacado = 1) then begin
           rDivida := rDivida + vLista[i].Valor;
         end;
       end;
     end;

     QryAux1.Next;
   end;


   if (dtmRelExtratoDesligamento.bRegReplanSaldado) or (dtmRelExtratoDesligamento.bRegReplan) then begin
     DescontoEmptmoRegReplan := rDivida;
   end else if (dtmRelExtratoDesligamento.bNovoPlano) then begin
     DescontoNovoPlano       := rDivida;
   end else if (dtmRelExtratoDesligamento.bReb) then begin
     fDESCONTOREBQ           := rDivida;
   end;

   FreeAndNil(dtmEmptmo);
   FreeAndNil(dtmLookEmptmo);
   FreeAndNil(dtmCalcEmptmo);

end;


procedure TfrmPExtratoDesligamento.SalarioParticipacao(pIdPessJur,
  pIdPessoa, pIdPlanoPrev: Integer);
  var rSalario : Real;
begin

  rSalario          :=0;
  rSalarioRegReplan :=0;
  rSalarioNovoPlano :=0;
  rSalarioREB       :=0;

  Proc_Salario.Close;
  Proc_Salario.ParamByname('pidpessoa').asinteger    := pIdPessoa;
  Proc_Salario.ParamByname('pidPessJur').asinteger   := pIdPessJur;
  Proc_Salario.ParamByname('pidPlanoPrev').asinteger := pIdPlanoPrev;

  if not Proc_Salario.Prepared then Proc_Salario.Prepare;

  Proc_Salario.ExecProc;


  QryAux.Close;
  QryAux.SQL.Clear;
  QryAux.SQL.Add(' SELECT SALTOTAL FROM ELEGPATRO ');
  QryAux.SQL.Add(' WHERE IDPESSOA = ' +IntTostr(pIdPessoa));
  //qryAux.SQL.Add(' AND IDSITPLANOPREV = 1     ');
  QryAux.Open;

  if (pIdPessJur = 1) or (Proc_Salario.ParamByname('SALARIO').asFloat = 0) then begin
    rSalario := QryAux.fieldByname('SALTOTAL').asFloat;
  end else begin
    rSalario := Proc_Salario.ParamByname('SALARIO').asFloat;
  end;

  if ((QryGrid.recordCount > 1) and (pIdPlanoPrev=74) or (pIdPlanoPrev=74)) then begin
    rSalarioNovoPlano                   := rSalario;
  end else begin
    //if (QryAux.FieldByname('IDPLANOPREV').asinteger = 2) and (pIdPlanoPrev=2) then begin
    if (pIdPlanoPrev=2) then begin
     rSalarioRegReplan                  := rSalario;
    end;
    //if (QryAux.FieldByname('IDPLANOPREV').asinteger = 66) and (pIdPlanoPrev=66) then begin
    if (pIdPlanoPrev=66) then begin
     rSalarioREB                        := rSalario;
    end;
  end;

{  dtmRelExtratoDesligamento.lblNaoElegivelSALNovoPlano.Visible  := (rSalarioNovoPlano=0);
  dtmRelExtratoDesligamento.lblNaoElegivelSALRegReplan.Visible  := (rSalarioRegReplan=0);
  dtmRelExtratoDesligamento.lblNaoElegivelSALReb.Visible        := (rSalarioReb=0);}


end;

procedure TfrmPExtratoDesligamento.Sel(i: Extended);
begin
  with qry do
  begin
     Close;
     ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
     Open;
  end;
end;

procedure TfrmPExtratoDesligamento.InsereSexoIdade(xIdPessoa: Integer);
var
  qryISI : TwwQuery;
  Idade  : Integer;
begin
  try
    IntToStr(xIdPessoa);
  except
    Exit;
  end;

  try
    qryISI              := TwwQuery.Create(Self);
    qryISI.DatabaseName := 'BaseDados';

    qryISI.Close;
    qryISI.Sql.Clear;
    qryISI.SQL.Add('SELECT datanasc, sexo FROM pessoafisica');
    qryISI.SQL.Add('WHERE');
    qryISI.SQL.Add('idpessoa = ' + IntToStr(xIdPessoa));

    try
      qryISI.Open;
    except
      qryISI.Close;
      FreeAndNil(qryISI);
      Exit;
    end;

    try
      StrToDate(qryISI.FieldByName('datanasc').AsString);
    except
      qryISI.Close;
      FreeAndNil(qryISI);
      Exit;
    end;

    Idade := Trunc((Date - StrToDate(qryISI.FieldByName('datanasc').AsString))/365.25);

    dtmRelExtratoDesligamento.cds.FieldByname('idade').AsInteger    := Idade;

    if qryISI.FieldByName('sexo').AsString = 'F' then
      dtmRelExtratoDesligamento.cds.FieldByname('sexo').AsString := 'Feminino'
    else
      dtmRelExtratoDesligamento.cds.FieldByname('sexo').AsString := 'Masculino';

  finally
    qryISI.Close;
    FreeAndNil(qryISI);
  end;
end;

// INI RN006

Function TfrmPExtratoDesligamento.VerificarExisteDemissao (xIdPessoa : Integer) : String;
var
  qryVerExisteDemissao : TwwQuery;
begin
  Result := '';
  qryVerExisteDemissao := TwwQuery.Create(Self);
  try
    qryVerExisteDemissao.DatabaseName := 'BaseDados';
    with qryVerExisteDemissao do
    begin
      SQL.Clear;
      SQL.Add('SELECT DATADEMISSAO');
      SQL.Add('  FROM ELEGPATRO');
      SQL.Add(' WHERE idpessoa = :idpessoa');

      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := xIdPessoa;
    end;
    qryVerExisteDemissao.Prepare;
    qryVerExisteDemissao.Open;

    if (qryVerExisteDemissao.IsEmpty) then
    begin
      Result := qryVerExisteDemissao.FieldByName('DATADEMISSAO').AsString;
    end
    else begin
      Result := qryGrid.FieldByname('DATADEMISSAO').AsString;
    end;
  finally
    qryVerExisteDemissao.Close;
    FreeAndNil(qryVerExisteDemissao);
  end;
end;

function TfrmPExtratoDesligamento.ValidarPossuiMais3AnosContribuicao (xIdPessoa, xIdPlanoPrev : Integer): Boolean;
var
  qryHstContribuicaoPrev : TwwQuery;
begin
  Result := False;
  qryHstContribuicaoPrev := TwwQuery.Create(Self);
  try
    qryHstContribuicaoPrev.DatabaseName := 'BaseDados';
    with qryHstContribuicaoPrev do
    begin
      SQL.Clear;
      SQL.Add('SELECT COUNT(Q.mescobrancaqtde) contagem_contribuicoes');
      SQL.Add('  FROM (SELECT HCP.mesreferencia,');
      SQL.Add('               COUNT(HCP.mesreferencia) mescobrancaqtde');
      SQL.Add('          FROM hstcontribprev HCP');
      SQL.Add('         WHERE HCP.idpessoa = :idpessoa');
      SQL.Add('           AND SUBSTR(TRIM(HCP.mesreferencia), 6, 2) <> ''13''');
      SQL.Add('           AND HCP.sitrecebimento = ''2''');
      SQL.Add('           AND HCP.FLGDEVOLUCAO = 0 ');
      SQL.Add('           AND HCP.IDPLANOPREV = ' + IntToStr(xIdPlanoPrev));
      SQL.Add('           and hcp.idcontribuicao <> 630 ');
      SQL.Add('           and hcp.idcontribuicao <> 629 ');
      SQL.Add('         GROUP BY HCP.mesreferencia) Q');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := xIdPessoa;
    end;
    qryHstContribuicaoPrev.Prepare;
    qryHstContribuicaoPrev.Open;
    if (not(qryHstContribuicaoPrev.IsEmpty)) and (qryHstContribuicaoPrev.FieldByName('contagem_contribuicoes').AsInteger >= 36) then
    begin
      Result := True;
    end
    else begin
      Result := False;
    end;
  finally
    qryHstContribuicaoPrev.Close;
    FreeAndNil(qryHstContribuicaoPrev);
  end;
end;



Function TfrmPExtratoDesligamento.Elegibilidade_Resgate_Portabilidade (xIdPessoa : Integer) : Boolean;
var
  qryElegibilidade : TwwQuery;
begin
  qryElegibilidade := TwwQuery.Create(Self);
  qryElegibilidade.DataBaseName := 'BaseDados';

  Resgate         := True;
  Portabilidade   := True;

  try
    // Verificando Elegibilidade Resgate

    with qryElegibilidade do begin
      Sql.Clear;
      Sql.Add('SELECT IDPESSOA');
      Sql.Add('  FROM EVENTOSPREV');
      Sql.Add(' WHERE idpessoa = :idpessoa');
      Sql.Add('   AND ideventogerador IN (' + QuotedStr('15') + ','  + QuotedStr('345') + ')');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := xIdPessoa;
    end;
    qryElegibilidade.Prepare;
    try
      qryElegibilidade.Open;
    except
      qryElegibilidade.Close;
      FreeAndNil(qryElegibilidade);
      MessageBox(0, PChar('Problemas para verificar regras de elegibilidade do portador'), 'RESGATE', MB_OK + MB_ICONERROR);
    end;
    if (not qryElegibilidade.IsEmpty) then
    begin
      Resgate := True;
    end
    else begin
      Resgate := False;
    end;

    // Verificando Elegibilidade Portabilidade

    with qryElegibilidade do begin
      Sql.Clear;
      Sql.Add('SELECT IDPESSOA');
      Sql.Add('  FROM EVENTOSPREV');
      Sql.Add(' WHERE idpessoa = :idpessoa');
      Sql.Add('   AND ideventogerador = ' + QuotedStr('334'));
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := xIdPessoa;
    end;
    qryElegibilidade.Prepare;
    try
      qryElegibilidade.Open;
    except
      qryElegibilidade.Close;
      FreeAndNil(qryElegibilidade);
      MessageBox(0, PChar('Problemas para verificar regras de elegibilidade do portador'), 'PORTABILIDADE', MB_OK + MB_ICONERROR);
    end;
    if (not qryElegibilidade.IsEmpty) then
    begin
      Portabilidade := True;
    end
    else begin
      Portabilidade := False;
    end;

  finally
    qryElegibilidade.Close;
    FreeAndNil(qryElegibilidade);
  end;

  if Resgate or Portabilidade then begin
    Result := True;
  end
  else begin
    Result := False;
  end;
end;

function TfrmPExtratoDesligamento.ValidarSemResgatePortabilidadeouBeneficioRendaContinuada (xIdPessoa, xIdPlanoPrev : Integer; xRegraElegibilidade : SmallInt) : Boolean;
var
  flgEventoGeradorResgate : String;
  qryBenefbfciario : TwwQuery;

  function ListaBeneficios (xTipo : SmallInt) : String;
  var
    beneficios : TStrings;
  begin

    {
       0 - Novo Plano
       1 - Reb
       2 - Reg/Replan
    }

     beneficios := TStringList.Create;
     beneficios.Clear;
     try
       case xTipo of
                          0 : begin //reElegibilidadeBPD
                                case xIdPlanoPrev of
                                  2 : begin //REG/REPLAN
                                        beneficios.Add('149'); //REG/REPLAN - Suplem Apos Tempo Contrib
                                        beneficios.Add('154'); //REG/REPLAN - Suplem Aposent Especial
                                        beneficios.Add('156'); //REG/REPLAN - Suplem Aposent por Idade
                                        beneficios.Add('159'); //REG/REPLAN - Suplem Aposent Invalidez
                                        beneficios.Add('338'); //REG/REPLAN - Suplem Pensão Assistido
                                        beneficios.Add('164'); //REG/REPLAN - Suplem de Pensão Ativo
                                        beneficios.Add('492'); //REG/REPLAN - Beneficio Pleno
                                        beneficios.Add('495'); //REG/REPLAN - Suplem Ap T Contrib Saldada
                                        beneficios.Add('496'); //REG/REPLAN - Suplem Pensão Saldada AT
                                        beneficios.Add('497'); //REG/REPLAN - Suplem Pensão Saldada AS
                                        beneficios.Add('503'); //REG/REPLAN - Suplem Ap por Idade Saldada
                                        beneficios.Add('504'); //REG/REPLAN - Suplem Ap Invalidez Saldada
                                        beneficios.Add('505'); //REG/REPLAN - Suplem Ap Especial Saldada
                                        beneficios.Add('506'); //REG/REPLAN - Beneficio Único Antecipado TC
                                        beneficios.Add('507'); //REG/REPLAN - Benef Único Antecipado Esp
                                        beneficios.Add('508'); //REG/REPLAN - Benef Único Antecip Idade
                                        beneficios.Add('509'); //REG/REPLAN - Benef Único Antecip Inval
                                        beneficios.Add('513'); //REG/REPLAN - Benef Programado Pleno
                                        beneficios.Add('514'); //REG/REPLAN - Benef Programado Antecipado
                                        beneficios.Add('515'); //REG/REPLAN - Benef Único Antecip Pensão
                                        beneficios.Add('521'); //REG/REPLAN - Beneficio por Invalidez
                                        beneficios.Add('522'); //REG/REPLAN - Benef. Pensão por Morte
                                        beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                        beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                        beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                        beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                        beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                        beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                        beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                        beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                        beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                        beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                      end;
                                 66 : begin //REB
                                        beneficios.Add('151'); //REB - Benef Diferido Deslig Tit. Licenc
                                        beneficios.Add('152'); //REB - Renda Vitalícia Tempo Contribuição
                                        beneficios.Add('160'); //REB - Renda Vital. Invalidez PartTit Lic
                                        beneficios.Add('161'); //REB - Renda Vitalícia Apos. Invalidez
                                        beneficios.Add('165'); //REB - Pensão por Morte Ativo
                                        beneficios.Add('171'); //REB - Pensão por Morte do Part Tit Lic
                                        beneficios.Add('251'); //REB - Renda Antecipada  Apos Invalidez
                                        beneficios.Add('252'); //REB - Renda Antecipada Tempo Contrib
                                        beneficios.Add('277'); //REB - Resgate Falecimento Partic Ativo
                                        beneficios.Add('278'); //REB - Pensão por Morte Assistido
                                        beneficios.Add('279'); //REB - Pecúlio por Morte Assistido
                                        beneficios.Add('318'); //REB - Benefício Pleno
                                        beneficios.Add('319'); //REB - Renda Antecipada Tempo Contrib
                                        beneficios.Add('320'); //REB - Renda Vitalícia Tempo Contrib
                                        beneficios.Add('323'); //REB - Resgate Falecimento Part Ativo
                                        beneficios.Add('324'); //REB - Pensão por Morte Ativo
                                        beneficios.Add('325'); //REB - Pensão por Morte Assistido
                                        beneficios.Add('326'); //REB - Pensão por Morte Partic Licenc
                                        beneficios.Add('327'); //REB - Renda Antecipada Apos. Inval
                                        beneficios.Add('328'); //REB - Renda Vitalícia Apos Invalidez
                                        beneficios.Add('329'); //REB - Renda Vitalícia Inval Part Lic
                                        beneficios.Add('517'); //REB - Renda Antecipada BP
                                        beneficios.Add('526'); //REB - Resgate Falecimento Part Ativo
                                        beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                        beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                        beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                        beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                        beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                        beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                        beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                        beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                        beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                        beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                      end;
                                 74 : begin //NOVO PLANO
                                        beneficios.Add('299'); //F/PMPP - Aposentadoria
                                        beneficios.Add('300'); //F/PMPP - Aposentadoria (Lei 6683/79)
                                        beneficios.Add('301'); //F/PMPP - Aposentadoria CEF
                                        beneficios.Add('302'); //F/PMPP - Pensão por Morte
                                        beneficios.Add('303'); //F/PMPP - Pensão por Morte (Aposent CEF)
                                        beneficios.Add('304'); //F/PMPP - Pensão por Morte (Lei 6683/79)
                                        beneficios.Add('479'); //NP - Benef Programado Pleno
                                        beneficios.Add('480'); //NP - Benef Programado Antecipado
                                        beneficios.Add('481'); //NP - Beneficio por Invalidez
                                        beneficios.Add('482'); //NP - Benef Pensão por Morte Ativo
                                        beneficios.Add('483'); //NP - Benef Único Antecipado
                                        beneficios.Add('484'); //NP - Benef Único Antecipado Invalidez
                                        beneficios.Add('487'); //NP - Beneficio Pleno
                                        beneficios.Add('488'); //NP - Benef Pensão por Morte Assistido
                                        beneficios.Add('528'); //NP - Resgate de Contribuições para Beneficiário Designado
                                        beneficios.Add('518'); //NP - Benef Único Antecipado BP
                                        beneficios.Add('520'); //NP - Beneficio Único Antecipado Pensão
                                        beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                        beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                        beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                        beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                        beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                        beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                        beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                        beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                        beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                        beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                        beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                      end;
                                 end;
                              end;
                                    1 : begin // reElegibilidadePortabilidade
                                          case xIdPlanoPrev of
                                            2 : begin //REG/REPLAN
                                                  beneficios.Add('149'); //REG/REPLAN - Suplem Apos Tempo Contrib
                                                  beneficios.Add('154'); //REG/REPLAN - Suplem Aposent Especial
                                                  beneficios.Add('156'); //REG/REPLAN - Suplem Aposent por Idade
                                                  beneficios.Add('159'); //REG/REPLAN - Suplem Aposent Invalidez
                                                  beneficios.Add('338'); //REG/REPLAN - Suplem Pensão Assistido
                                                  beneficios.Add('164'); //REG/REPLAN - Suplem de Pensão Ativo
                                                  beneficios.Add('492'); //REG/REPLAN - Beneficio Pleno
                                                  beneficios.Add('495'); //REG/REPLAN - Suplem Ap T Contrib Saldada
                                                  beneficios.Add('496'); //REG/REPLAN - Suplem Pensão Saldada AT
                                                  beneficios.Add('497'); //REG/REPLAN - Suplem Pensão Saldada AS
                                                  beneficios.Add('503'); //REG/REPLAN - Suplem Ap por Idade Saldada
                                                  beneficios.Add('504'); //REG/REPLAN - Suplem Ap Invalidez Saldada
                                                  beneficios.Add('505'); //REG/REPLAN - Suplem Ap Especial Saldada
                                                  beneficios.Add('506'); //REG/REPLAN - Beneficio Único Antecipado TC
                                                  beneficios.Add('507'); //REG/REPLAN - Benef Único Antecipado Esp
                                                  beneficios.Add('508'); //REG/REPLAN - Benef Único Antecip Idade
                                                  beneficios.Add('509'); //REG/REPLAN - Benef Único Antecip Inval
                                                  beneficios.Add('513'); //REG/REPLAN - Benef Programado Pleno
                                                  beneficios.Add('514'); //REG/REPLAN - Benef Programado Antecipado
                                                  beneficios.Add('515'); //REG/REPLAN - Benef Único Antecip Pensão
                                                  beneficios.Add('521'); //REG/REPLAN - Beneficio por Invalidez
                                                  beneficios.Add('522'); //REG/REPLAN - Benef. Pensão por Morte
                                                  beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                                  beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                                  beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                                  beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                                  beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                                  beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                                  beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                                  beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                                  beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                                  beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                                end;
                                           66 : begin //REB
                                                  beneficios.Add('151'); //REB - Benef Diferido Deslig Tit. Licenc
                                                  beneficios.Add('152'); //REB - Renda Vitalícia Tempo Contribuição
                                                  beneficios.Add('160'); //REB - Renda Vital. Invalidez PartTit Lic
                                                  beneficios.Add('161'); //REB - Renda Vitalícia Apos. Invalidez
                                                  beneficios.Add('165'); //REB - Pensão por Morte Ativo
                                                  beneficios.Add('171'); //REB - Pensão por Morte do Part Tit Lic
                                                  beneficios.Add('251'); //REB - Renda Antecipada  Apos Invalidez
                                                  beneficios.Add('252'); //REB - Renda Antecipada Tempo Contrib
                                                  beneficios.Add('277'); //REB - Resgate Falecimento Partic Ativo
                                                  beneficios.Add('278'); //REB - Pensão por Morte Assistido
                                                  beneficios.Add('279'); //REB - Pecúlio por Morte Assistido
                                                  beneficios.Add('318'); //REB - Benefício Pleno
                                                  beneficios.Add('319'); //REB - Renda Antecipada Tempo Contrib
                                                  beneficios.Add('320'); //REB - Renda Vitalícia Tempo Contrib
                                                  beneficios.Add('323'); //REB - Resgate Falecimento Part Ativo
                                                  beneficios.Add('324'); //REB - Pensão por Morte Ativo
                                                  beneficios.Add('325'); //REB - Pensão por Morte Assistido
                                                  beneficios.Add('326'); //REB - Pensão por Morte Partic Licenc
                                                  beneficios.Add('327'); //REB - Renda Antecipada Apos. Inval
                                                  beneficios.Add('328'); //REB - Renda Vitalícia Apos Invalidez
                                                  beneficios.Add('329'); //REB - Renda Vitalícia Inval Part Lic
                                                  beneficios.Add('517'); //REB - Renda Antecipada BP
                                                  beneficios.Add('526'); //REB - Resgate Falecimento Part Ativo
                                                  beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                                  beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                                  beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                                  beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                                  beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                                  beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                                  beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                                  beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                                  beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                                  beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                                end;
                                           74 : begin //NOVO PLANO
                                                  beneficios.Add('299'); //F/PMPP - Aposentadoria
                                                  beneficios.Add('300'); //F/PMPP - Aposentadoria (Lei 6683/79)
                                                  beneficios.Add('301'); //F/PMPP - Aposentadoria CEF
                                                  beneficios.Add('302'); //F/PMPP - Pensão por Morte
                                                  beneficios.Add('303'); //F/PMPP - Pensão por Morte (Aposent CEF)
                                                  beneficios.Add('304'); //F/PMPP - Pensão por Morte (Lei 6683/79)
                                                  beneficios.Add('479'); //NP - Benef Programado Pleno
                                                  beneficios.Add('480'); //NP - Benef Programado Antecipado
                                                  beneficios.Add('481'); //NP - Beneficio por Invalidez
                                                  beneficios.Add('482'); //NP - Benef Pensão por Morte Ativo
                                                  beneficios.Add('483'); //NP - Benef Único Antecipado
                                                  beneficios.Add('484'); //NP - Benef Único Antecipado Invalidez
                                                  beneficios.Add('487'); //NP - Beneficio Pleno
                                                  beneficios.Add('488'); //NP - Benef Pensão por Morte Assistido
                                                  beneficios.Add('528'); //NP - Resgate de Contribuições para Beneficiário Designado
                                                  beneficios.Add('518'); //NP - Benef Único Antecipado BP
                                                  beneficios.Add('520'); //NP - Beneficio Único Antecipado Pensão
                                                  beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                                  beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                                  beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                                  beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                                  beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                                  beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                                  beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                                  beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                                  beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                                  beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                                  beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                                end;
                                          end;
                                        end;
                               2 : begin //reElegibilidadeResgate
                                    case xIdPlanoPrev of
                                      2 : begin //REG/REPLAN
                                            beneficios.Add('149'); //REG/REPLAN - Suplem Apos Tempo Contrib
                                            beneficios.Add('154'); //REG/REPLAN - Suplem Aposent Especial
                                            beneficios.Add('156'); //REG/REPLAN - Suplem Aposent por Idade
                                            beneficios.Add('159'); //REG/REPLAN - Suplem Aposent Invalidez
                                            beneficios.Add('338'); //REG/REPLAN - Suplem Pensão Assistido
                                            beneficios.Add('164'); //REG/REPLAN - Suplem de Pensão Ativo
                                            beneficios.Add('492'); //REG/REPLAN - Beneficio Pleno
                                            beneficios.Add('495'); //REG/REPLAN - Suplem Ap T Contrib Saldada
                                            beneficios.Add('496'); //REG/REPLAN - Suplem Pensão Saldada AT
                                            beneficios.Add('497'); //REG/REPLAN - Suplem Pensão Saldada AS
                                            beneficios.Add('503'); //REG/REPLAN - Suplem Ap por Idade Saldada
                                            beneficios.Add('504'); //REG/REPLAN - Suplem Ap Invalidez Saldada
                                            beneficios.Add('505'); //REG/REPLAN - Suplem Ap Especial Saldada
                                            beneficios.Add('506'); //REG/REPLAN - Beneficio Único Antecipado TC
                                            beneficios.Add('507'); //REG/REPLAN - Benef Único Antecipado Esp
                                            beneficios.Add('508'); //REG/REPLAN - Benef Único Antecip Idade
                                            beneficios.Add('509'); //REG/REPLAN - Benef Único Antecip Inval
                                            beneficios.Add('513'); //REG/REPLAN - Benef Programado Pleno
                                            beneficios.Add('514'); //REG/REPLAN - Benef Programado Antecipado
                                            beneficios.Add('515'); //REG/REPLAN - Benef Único Antecip Pensão
                                            beneficios.Add('521'); //REG/REPLAN - Beneficio por Invalidez
                                            beneficios.Add('522'); //REG/REPLAN - Benef. Pensão por Morte
                                            beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                            beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                            beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                            beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                            beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                            beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                            beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                            beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                            beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                            beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                          end;
                                     66 : begin //REB
                                            beneficios.Add('151'); //REB - Benef Diferido Deslig Tit. Licenc
                                            beneficios.Add('152'); //REB - Renda Vitalícia Tempo Contribuição
                                            beneficios.Add('160'); //REB - Renda Vital. Invalidez PartTit Lic
                                            beneficios.Add('161'); //REB - Renda Vitalícia Apos. Invalidez
                                            beneficios.Add('165'); //REB - Pensão por Morte Ativo
                                            beneficios.Add('171'); //REB - Pensão por Morte do Part Tit Lic
                                            beneficios.Add('251'); //REB - Renda Antecipada  Apos Invalidez
                                            beneficios.Add('252'); //REB - Renda Antecipada Tempo Contrib
                                            beneficios.Add('277'); //REB - Resgate Falecimento Partic Ativo
                                            beneficios.Add('278'); //REB - Pensão por Morte Assistido
                                            beneficios.Add('279'); //REB - Pecúlio por Morte Assistido
                                            beneficios.Add('318'); //REB - Benefício Pleno
                                            beneficios.Add('319'); //REB - Renda Antecipada Tempo Contrib
                                            beneficios.Add('320'); //REB - Renda Vitalícia Tempo Contrib
                                            beneficios.Add('323'); //REB - Resgate Falecimento Part Ativo
                                            beneficios.Add('324'); //REB - Pensão por Morte Ativo
                                            beneficios.Add('325'); //REB - Pensão por Morte Assistido
                                            beneficios.Add('326'); //REB - Pensão por Morte Partic Licenc
                                            beneficios.Add('327'); //REB - Renda Antecipada Apos. Inval
                                            beneficios.Add('328'); //REB - Renda Vitalícia Apos Invalidez
                                            beneficios.Add('329'); //REB - Renda Vitalícia Inval Part Lic
                                            beneficios.Add('517'); //REB - Renda Antecipada BP
                                            beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                            beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                            beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                            beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                            beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                            beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                            beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                            beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                            beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                            beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                          end;
                                     74 : begin //NOVO PLANO
                                            beneficios.Add('299'); //F/PMPP - Aposentadoria
                                            beneficios.Add('300'); //F/PMPP - Aposentadoria (Lei 6683/79)
                                            beneficios.Add('301'); //F/PMPP - Aposentadoria CEF
                                            beneficios.Add('302'); //F/PMPP - Pensão por Morte
                                            beneficios.Add('303'); //F/PMPP - Pensão por Morte (Aposent CEF)
                                            beneficios.Add('304'); //F/PMPP - Pensão por Morte (Lei 6683/79)
                                            beneficios.Add('479'); //NP - Benef Programado Pleno
                                            beneficios.Add('480'); //NP - Benef Programado Antecipado
                                            beneficios.Add('481'); //NP - Beneficio por Invalidez
                                            beneficios.Add('482'); //NP - Benef Pensão por Morte Ativo
                                            beneficios.Add('483'); //NP - Benef Único Antecipado
                                            beneficios.Add('484'); //NP - Benef Único Antecipado Invalidez
                                            beneficios.Add('487'); //NP - Beneficio Pleno
                                            beneficios.Add('488'); //NP - Benef Pensão por Morte Assistido
                                            beneficios.Add('528'); //NP - Resgate de Contribuições para Beneficiário Designado
                                            beneficios.Add('518'); //NP - Benef Único Antecipado BP
                                            beneficios.Add('378'); //Resgate de Contrib sem Dedução de IRRF
                                            beneficios.Add('418'); //Resgate Complementar com Dedução de IRRF
                                            beneficios.Add('458'); //Resgate Complementar sem Dedução de IRRF
                                            beneficios.Add('478'); //Resgate Judicial com Dedução de IRRF
                                            beneficios.Add('493'); //Portabilidade - Entidade Aberta
                                            beneficios.Add('510'); //Resgate Judicial sem Dedução de IRRF
                                            beneficios.Add('516'); //Portabilidade - Entidade Fechada
                                            beneficios.Add('523'); //Resgate de Contrib. com Dedução de IRRF - SALDADO
                                            beneficios.Add('524'); //Resgate de Contrib. sem Dedução de IRRF - SALDADO
                                            beneficios.Add('590'); //Resgate de Contribuições c/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('591'); //Resgate de Contribuições s/ Ded. IRRF-Beneficiário Designado
                                            beneficios.Add('231'); //Resgate de Contrib com Dedução de IRRF
                                          end;
                                    end;
                                  end;
       end;
       Result := StringReplace(beneficios.CommaText, ';', ',', [rfReplaceAll]);
     finally
       FreeAndNil(beneficios);
     end;
  end;
begin
  Result := True;
  try
    if (xRegraElegibilidade in [0, 1, 2]) and (xIdPlanoPrev in [2, 66, 74]) then
    begin
      qryBenefbfciario := TwwQuery.Create(nil);
      try
        qryBenefbfciario.DatabaseName := 'BaseDados';
        with qryBenefbfciario do
        begin
          SQL.Clear;
          SQL.Add('SELECT B.idbeneficio');
          SQL.Add('  FROM benefbfciario B');
          SQL.Add(' WHERE B.idpessoa = :idpessoa');
          SQL.Add('   AND B.idplanoprev = :idplanoprev');
          SQL.Add('   AND B.idbeneficio IN (' + ListaBeneficios(xRegraElegibilidade) + ')');
          Params.Clear;
          Params.CreateParam(ftInteger, 'idpessoa', ptInput);
          ParamByName('idpessoa').AsInteger := xIdPessoa;
          Params.CreateParam(ftInteger, 'idplanoprev', ptInput);
          ParamByName('idplanoprev').AsInteger := xIdPlanoPrev;
        end;
        qryBenefbfciario.Prepare;
        qryBenefbfciario.Open;
        Result := qryBenefbfciario.IsEmpty; //Não deve existir nenhum registro.
      finally
        FreeAndNil(qryBenefbfciario);
      end;
    end;
  except
    Result := False;
    raise;
  end;
end;


// FIM RN006


// INI RN007

Function TfrmPExtratoDesligamento.CarregarSexo (xIdPessoa : Integer) : String;
var
  qryHstContribuicaoPrev : TwwQuery;
begin
  Result := '';
  qryHstContribuicaoPrev := TwwQuery.Create(Self);
  try
    qryHstContribuicaoPrev.DatabaseName := 'BaseDados';
    with qryHstContribuicaoPrev do
    begin
      SQL.Clear;
      SQL.Add('SELECT SEXO ');
      SQL.Add('  FROM PESSOAFISICA');
      SQL.Add(' WHERE idpessoa = :idpessoa');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := xIdPessoa;
    end;
    qryHstContribuicaoPrev.Prepare;
    qryHstContribuicaoPrev.Open;
    if (not(qryHstContribuicaoPrev.IsEmpty)) then
    begin
      Result := qryHstContribuicaoPrev.FieldByName('SEXO').AsString;
    end;
  finally
    FreeAndNil(qryHstContribuicaoPrev);
  end;
end;

function TfrmPExtratoDesligamento.CarregarIdade (xIdPessoa : Integer): Integer;
var
  qryHstContribuicaoPrev : TwwQuery;
begin
  Result := 0;
  qryHstContribuicaoPrev := TwwQuery.Create(nil);
  try
    qryHstContribuicaoPrev.DatabaseName := 'BaseDados';
    with qryHstContribuicaoPrev do
    begin
      SQL.Clear;
      SQL.Add('SELECT DATANASC ');
      SQL.Add('  FROM PESSOAFISICA');
      SQL.Add(' WHERE idpessoa = :idpessoa');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := xIdPessoa;
    end;
    qryHstContribuicaoPrev.Prepare;
    qryHstContribuicaoPrev.Open;
    if (not(qryHstContribuicaoPrev.IsEmpty)) then
    begin
      Result := (Trunc((Date-qryHstContribuicaoPrev.FieldByName('DATANASC').AsDateTime)/365.25));
    end;
  finally
    FreeAndNil(qryHstContribuicaoPrev);
  end;
end;

function TfrmPExtratoDesligamento.ValidarPossuiMais10AnosContribuicao (xIdPessoa : Integer) : Boolean;
var
  qryHstContribuicaoPrev : TwwQuery;
begin
  Result := False;
  qryHstContribuicaoPrev := TwwQuery.Create(nil);
  try
    qryHstContribuicaoPrev.DatabaseName := 'BaseDados';
    with qryHstContribuicaoPrev do
    begin
      SQL.Clear;
      SQL.Add('SELECT COUNT(Q.mescobrancaqtde) contagem_contribuicoes');
      SQL.Add('  FROM (SELECT HCP.mesreferencia,');
      SQL.Add('               COUNT(HCP.mesreferencia) mescobrancaqtde');
      SQL.Add('          FROM hstcontribprev HCP');
      SQL.Add('         WHERE HCP.idpessoa = :idpessoa');
      SQL.Add('           AND SUBSTR(TRIM(HCP.mesreferencia), 6, 2) <> ''13''');
      SQL.Add('           AND HCP.sitrecebimento = ''2''');
      SQL.Add('           AND HCP.FLGDEVOLUCAO = 0 ');
      SQL.Add('         GROUP BY HCP.mesreferencia) Q');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := xIdPessoa;
    end;
    qryHstContribuicaoPrev.Prepare;
    qryHstContribuicaoPrev.Open;
    if (not(qryHstContribuicaoPrev.IsEmpty)) and (qryHstContribuicaoPrev.FieldByName('contagem_contribuicoes').AsInteger >= 121) then
    begin
      Result := True;
    end;
  finally
    FreeAndNil(qryHstContribuicaoPrev);
  end;
end;

Function TfrmPExtratoDesligamento.VerificaEAposentado (xIdPessoa, xIdPlanoPrev : Integer) : Boolean;
var
  qryAposentado : TwwQuery;
  Idade  : Integer;
begin

  qryAposentado              := TwwQuery.Create(Self);
  qryAposentado.DatabaseName := 'BaseDados';

  try
    with qryAposentado do begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT IDPESSOA');
      Sql.Add('FROM BENEFBFCIARIO');
      Sql.Add('WHERE');
      Sql.Add('IDPESSOA = :idpessoa');
      Sql.Add('AND IDPLANOPREV = :idplanoprev'); //BRUNO AZEVEDO
      Sql.Add('AND FONTEPAGADORA = 2');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      Params.CreateParam(ftInteger, 'idplanoprev', ptInput);
      ParamByName('idpessoa').AsInteger := xIdPessoa;
      ParamByName('idplanoprev').AsInteger := xIdPlanoPrev;
      Prepare;
      try
        Open;
      except
        Close;
        FreeAndNil(qryAposentado);
        Exit;
      end;
    end;
    Result := (not qryAposentado.IsEmpty);
  finally
    qryAposentado.Close;
    FreeAndNil(qryAposentado);
  end;
end;

// FIM RN007

// INI RN013 - Portabilidade Elegibilidade



{function TfrmPExtratoDesligamento.ExisteRegraElegibilidadeBeneficio(AIdBeneficio: Integer; var OIdRegraElegibili : Integer): Boolean;
var
  qryBenefPlanPrev : TwwQuery;
begin
  Result := False;
  OIdRegraElegibili := 0;
  qryBenefPlanPrev := TwwQuery.Create(nil);
  try
    qryBenefPlanPrev.DatabaseName := FBDEDatabaseName;
    with qryBenefPlanPrev do
    begin
      SQL.Clear;
      SQL.Add('SELECT BPP.idregraelegibili');
      SQL.Add('  FROM benefplanprev BPP');
      SQL.Add(' WHERE BPP.Idbeneficio = :idbeneficio');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idbeneficio', ptInput);
      ParamByName('idbeneficio').AsInteger := AIdBeneficio;
    end;
    qryBenefPlanPrev.Prepare;
    qryBenefPlanPrev.Open;
    if (not(qryBenefPlanPrev.IsEmpty) and not(qryBenefPlanPrev.FieldByName('idregraelegibili').IsNull)) then
    begin
      OIdRegraElegibili := qryBenefPlanPrev.FieldByName('idregraelegibili').AsInteger;
      Result := True;
    end;
  finally
    FreeAndNil(qryBenefPlanPrev);
  end;
end;

function TfrmPExtratoDesligamento.ExisteBeneficioVinculado(AIdBeneficio: Integer): Boolean;
var
  qryBenefbfciario : TwwQuery;
begin
  Result := False;
  qryBenefbfciario := TwwQuery.Create(nil);
  try
    qryBenefbfciario.DataBaseName := 'BaseDados';
    with qryBenefbfciario do
    begin
      SQL.Clear;
      SQL.Add('SELECT B.idbeneficio');
      SQL.Add('  FROM benefbfciario B');
      SQL.Add(' WHERE B.idpessoa = :idpessoa');
      SQL.Add('   AND B.idbeneficio = :idbeneficio');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := IdPessoa;
      Params.CreateParam(ftInteger, 'idbeneficio', ptInput);
      ParamByName('idbeneficio').AsInteger := AIdBeneficio;
    end;
    qryBenefbfciario.Prepare;
    qryBenefbfciario.Open;
    Result := not(qryBenefbfciario.IsEmpty);
  finally
    FreeAndNil(qryBenefbfciario);
  end;
end;

}
function TfrmPExtratoDesligamento.BPDElegibilidade: Boolean; // RN006
var
  Possui3AnosContribuicao, ResgateOuPortabilidade, RendaContinuada : Boolean;
begin
  if ValidarPossuiMais3AnosContribuicao (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').asInteger) then begin
    Possui3AnosContribuicao := True;
  end
  else begin
    Possui3AnosContribuicao := False;
  end;

  if Elegibilidade_Resgate_Portabilidade (iIdPessoa) then begin
    ResgateOuPortabilidade := True;
  end
  else begin
    ResgateOuPortabilidade := False;
  end;

//  if ValidarSemResgatePortabilidadeouBeneficioRendaContinuada (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger, 0) then
  if (not ElegibilidadeBeneficioDeRendaContinuada (qryGrid.fieldByname('IDPLANOPREV').asInteger)) then
  begin
    RendaContinuada := False;
  end
  else begin
    RendaContinuada := True;
  end;

  if (Possui3AnosContribuicao) and
     (not ResgateOuPortabilidade) and
     (not RendaContinuada) and
     (not dtmRelExtratoDesligamento.bRegReplanSaldado = True) then
  begin
    Result := False;
  end
  else begin
    Result := True;
  end;

end;

function TfrmPExtratoDesligamento.ElegibilidadeBeneficioDeRendaContinuada (xTipo : SmallInt): Boolean; // RN007
var
  xSexo : String;
  xIdade : SmallInt;
  Elegibilidade : Boolean;
begin
  {
     0 - Novo Plano
     1 - Reb
     2 - Reg/Replan
  }

  xSexo  := CarregarSexo(iIdPessoa);
  xIdade := CarregarIdade(iIdPessoa);

  case xTipo of
    74 : begin  // Novo Plano
          if Trim(xSexo) = 'M' then
          begin
            if (xIdade >= 53) or ((VerificaEAposentado (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger)) and (ValidarPossuiMais10AnosContribuicao (iIdPessoa))) then begin
              Elegibilidade := True;
            end
            else begin
              Elegibilidade := False;
            end;
          end
          else begin
            if (xIdade >= 48) or ((VerificaEAposentado (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger)) and (ValidarPossuiMais10AnosContribuicao (iIdPessoa))) then begin
              Elegibilidade := True;
            end
            else begin
              Elegibilidade := False;
            end;
          end;
        end;

    66 : begin // Reb
          if (xIdade >= 55) or ((VerificaEAposentado (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger)) and (ValidarPossuiMais10AnosContribuicao (iIdPessoa))) then begin
            Elegibilidade := True;
          end
          else begin
            Elegibilidade := False;
          end;
        end;

    2 : begin // RegReplan
          if VerificaEAposentado (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger) then begin
            Elegibilidade := True;
          end
          else begin
            Elegibilidade := False;
          end;
        end;
  end;
  Result := Elegibilidade;
end;

function TfrmPExtratoDesligamento.DefineElegibilidade_Portabilidade(
  xPlano: SmallInt; DtInscricao : String): Boolean; // RN013
var
  QryAutoPatrocinio : TwwQuery;
  TempoContribuicao : SmallInt;

  DtCancelamento, DtDemissao, DtIniAutoPatrocinio : String;

  QtdeAutoPatrocinio : Integer;
  Elegivel : Boolean;
  Cancelamento : Boolean;
  Demissao     : Boolean;
begin
  Cancelamento := False;
  Demissao     := False;

  if QryGrid.RecordCount = 1 then begin
    try
      DtCancelamento := RetornaDataCancelamento(iIdPessoa);
      DtDemissao     := RetornaDataDemissao(iIdPessoa);

      if (DtInscricao <> '') then
      begin
        if (DtDemissao <> '') and (DtCancelamento <> '') then
        begin
          if StrToDate(DtDemissao) < StrToDate(DtCancelamento) then
          begin
            TempoContribuicao := Trunc((StrToDate(DtDemissao) - StrToDate(DtInscricao))/365.25);
          end
          else begin
            TempoContribuicao := Trunc(StrToDate(DtCancelamento) - (StrToDate(DtInscricao))/365.25);
          end;
        end
        else begin
          if (DtDemissao = '') and (DtCancelamento = '') then
          begin
            TempoContribuicao := Trunc((Date - StrToDate(DtInscricao))/365.25);
          end
          else if (DtDemissao = '') then
          begin
            TempoContribuicao := Trunc((StrToDate(DtCancelamento) - StrToDate(DtInscricao))/365.25);
            Cancelamento := True;
          end
          else begin
            TempoContribuicao := Trunc((StrToDate(DtDemissao) - StrToDate(DtInscricao))/365.25);
            Demissao := True;
          end;
        end;
        if TempoContribuicao >= 3 then begin
          if (not Elegibilidade_AutoPatrocinio (iIdPessoa)) and
             (not VerificaEAposentado (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger)) and // Verificando Se é Aposentado
             (not Elegibilidade_Resgate_Portabilidade (iIdPessoa)) and
             (not ElegibilidadeBeneficioDeRendaContinuada (qryGrid.fieldByname('IDPLANOPREV').asInteger)) then
          begin
            Elegivel := True;
          end
          else begin
            Elegivel := False;
          end;
        end
        else begin
          QtdeAutoPatrocinio := RetornaQtdeMesesAutoPatrocinio (iIdPessoa);
          if QtdeAutoPatrocinio > 0 then begin
            DtIniAutoPatrocinio := SubtrairMesesAutoPatrocinio(DtInscricao, QtdeAutoPatrocinio);

            if Cancelamento then begin
              // Cancelamento
              TempoContribuicao := Trunc((StrToDate(DtCancelamento) - StrToDate(DtIniAutoPatrocinio))/365.25);
            end
            else begin
              // Demissao
              TempoContribuicao := Trunc((StrToDate(DtDemissao) - StrToDate(DtIniAutoPatrocinio))/365.25);
            end;

            if TempoContribuicao >= 3 then begin
              if (not Elegibilidade_AutoPatrocinio (iIdPessoa)) and
                 (not VerificaEAposentado (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger)) and // Verificando Se é Aposentado
                 (not Elegibilidade_Resgate_Portabilidade (iIdPessoa)) and
                 (not ElegibilidadeBeneficioDeRendaContinuada (qryGrid.fieldByname('IDPLANOPREV').asInteger)) then
              begin
                Elegivel := True;
              end
              else begin
                Elegivel := False;
              end;
            end
            else begin
              Elegivel := False;
            end;
          end
          else begin
            Elegivel := False;
          end;
        end;

      end
      else begin
        Elegivel := False;
      end;
    except
      Elegivel := False;
    end;

    Portabilidade := Elegivel;
  end
  else if QryGrid.RecordCount > 1 then begin

    if (Tem3AnosContribuicao(iIdPessoa,qryGrid.fieldByname('IDPLANOPREV').asInteger,iIdPessJur) and
       (not VerificaEAposentado (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger)) and // Verificando Se é Aposentado
       (not Elegibilidade_AutoPatrocinio (iIdPessoa)) and
       (not Elegibilidade_Resgate_Portabilidade (iIdPessoa)) ) then //and
       //BRUNO AZEVEDO SOL 167335 - O SISTEMA JA VERIFICA SE É APOSENTADO EM OUTRO PLANO, NÃO É NECESSÁRIO CHECAR RENDA CONTINUADA
       //(not ElegibilidadeBeneficioDeRendaContinuada (qryGrid.fieldByname('IDPLANOPREV').asInteger))) then
    begin
      Elegivel := True;
    end
    else begin
      Elegivel := False;
    end;

    Portabilidade := Elegivel;
  end;

  {
     0 - Novo Plano
     1 - Reb
     2 - Reg/Replan
  }

  case xPlano of
    0 : begin
          // Novo Plano
          if Elegivel then
          begin
            dtmRelExtratoDesligamento.lblNaoElegivelPortabilidadeNovoPlano.Caption := 'Elegível';
          end
          else begin
            dtmRelExtratoDesligamento.lblNaoElegivelPortabilidadeNovoPlano.Caption := 'Não Elegível';
          end;
        end;
    1 : begin
          // Reb
          if Elegivel then
          begin
            dtmRelExtratoDesligamento.lblNaoElegivelPortabilidadeReb.Caption := 'Elegível';
          end
          else begin
            dtmRelExtratoDesligamento.lblNaoElegivelPortabilidadeReb.Caption := 'Não Elegível';
          end;
        end;
    2 : begin
          // Reg/Replan
          if Elegivel then
          begin
            dtmRelExtratoDesligamento.lblNaoElegivelPortabilidadeRegReplan.Caption := 'Elegível';
          end
          else begin
            dtmRelExtratoDesligamento.lblNaoElegivelPortabilidadeRegReplan.Caption := 'Não Elegível';
          end;
        end;
  end;

end;

function TfrmPExtratoDesligamento.Elegibilidade_AutoPatrocinio(
  xIdPessoa: Integer): Boolean;
var
  qryAutoPatrocinio : TwwQuery;
begin
  qryAutoPatrocinio := TwwQuery.Create(Self);
  qryAutoPatrocinio.DataBaseName := 'BaseDados';

  AutoPatrocinio   := True;

  try
    // Verificando Elegibilidade AutoPatrocinio

    with qryAutoPatrocinio do begin
      Sql.Clear;
      Sql.Add('SELECT IDPESSOA');
      Sql.Add('  FROM EVENTOSPREV');
      Sql.Add(' WHERE idpessoa = :idpessoa');
      Sql.Add('   AND ideventogerador IN (' + QuotedStr('3') + ','  + QuotedStr('9') + ','  + QuotedStr('16') + ')');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := xIdPessoa;
    end;
    qryAutoPatrocinio.Prepare;
    try
      qryAutoPatrocinio.Open;
    except
      qryAutoPatrocinio.Close;
      FreeAndNil(qryAutoPatrocinio);
      MessageBox(0, PChar('Problemas para verificar regras de elegibilidade do portador'), 'AUTO PATROCÍNIO', MB_OK + MB_ICONERROR);
    end;
    if (not qryAutoPatrocinio.IsEmpty) then
    begin
      AutoPatrocinio := True;
      Result := AutoPatrocinio;
    end
    else begin
      AutoPatrocinio := False;
      Result := AutoPatrocinio;
    end;

  finally
    qryAutoPatrocinio.Close;
    FreeAndNil(qryAutoPatrocinio);
  end;
end;

function TfrmPExtratoDesligamento.DefineElegibilidade_Resgate(
  xPlano: SmallInt): Boolean; //RN018
var
  Elegivel : Boolean;
begin
  {
     0 - Novo Plano
     1 - Reb
     2 - Reg/Replan
  }

  if ((not VerificaEAposentado (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger)) and // Verificando Se é Aposentado
      (not Elegibilidade_Resgate_Portabilidade (iIdPessoa)) and // Verificando se não houve Resgate ou Portabilidade
      (not Elegibilidade_AutoPatrocinio(iIdPessoa)) and // Verificando Se não existe autopatrocínio
      (ValidarSemResgatePortabilidadeouBeneficioRendaContinuada (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger, 2))) then // Verificando se não houve renda Continuada
  begin
    Elegivel := True;
  end
  else begin
    Elegivel := False;
  end;

  case xPlano of
    0 : begin
          // Novo Plano
          if Elegivel then begin
            dtmRelExtratoDesligamento.lblNaoElegivelResgateNovoPlano.Caption := 'Elegível';
          end
          else begin
            dtmRelExtratoDesligamento.lblNaoElegivelResgateNovoPlano.Caption := 'Não Elegível';
          end;
        end;
    1 : begin
        // Reb
          if Elegivel then begin
            dtmRelExtratoDesligamento.lblNaoElegivelResgateReb.Caption := 'Elegível';
          end
          else begin
            dtmRelExtratoDesligamento.lblNaoElegivelResgateReb.Caption := 'Não Elegível';
          end;
        end;
    2 : begin
        // Reg/Replan
          if Elegivel then begin
            dtmRelExtratoDesligamento.lblNaoElegivelResgateRegReplan.Caption := 'Elegível';
          end
          else begin
            dtmRelExtratoDesligamento.lblNaoElegivelResgateRegReplan.Caption := 'Não Elegível';
          end;
        end;
  end;

end;

function TfrmPExtratoDesligamento.DefineElegibilidade_AutoPatrocinio(
  xPlano: SmallInt) : Boolean; // RN022
var
  Elegivel : Boolean;
begin
  {
     0 - Novo Plano
     1 - Reb
     2 - Reg/Replan
  }

  if ((not VerificaEAposentado (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger)) and // Verificando Se é Aposentado
      (not Elegibilidade_Resgate_Portabilidade (iIdPessoa)) and // Verificando se não houve Resgate ou Portabilidade
      (not EventoBPD(iIdPessoa)) and //BRUNO AZEVEDO SOL167335
      (not Elegibilidade_AutoPatrocinio(iIdPessoa)) and // Verificando Se não existe autopatrocínio
      (ValidarSemResgatePortabilidadeouBeneficioRendaContinuada (iIdPessoa, qryGrid.fieldByname('IDPLANOPREV').AsInteger, 0))) then // Verificando se não houve renda Continuada
  begin
    Elegivel := True;
  end
  else begin
    Elegivel := False;
  end;

  case xPlano of
    0 : begin
          // Novo Plano
          if Elegivel then begin
            dtmRelExtratoDesligamento.lblNaoElegivelSALNovoPlano.Caption := 'Elegível';
          end
          else begin
            dtmRelExtratoDesligamento.lblNaoElegivelSALNovoPlano.Caption := 'Não Elegível';
          end;
        end;
    1 : begin
        // Reb
          if Elegivel then begin
            dtmRelExtratoDesligamento.lblNaoElegivelSALREB.Caption := 'Elegível';
          end
          else begin
            dtmRelExtratoDesligamento.lblNaoElegivelSALREB.Caption := 'Não Elegível';
          end;
        end;
    2 : begin
        // Reg/Replan
          if Elegivel then begin
            dtmRelExtratoDesligamento.lblNaoElegivelSALRegReplan.Caption := 'Elegível';
          end
          else begin
            dtmRelExtratoDesligamento.lblNaoElegivelSALRegReplan.Caption := 'Não Elegível';
          end;
        end;
  end;

end;

function TfrmPExtratoDesligamento.RetornaDataCancelamento(
  xIdPessoa: Integer): String;
var
  QryDtCanc : TwwQuery;
begin
  QryDtCanc := TwwQuery.Create(Self);
  QryDtCanc.DataBaseName := 'BaseDados';

  try
    with QryDtCanc do begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT dataevento');
      Sql.Add('  FROM EVENTOSPREV');
      Sql.Add(' WHERE idpessoa = :idpessoa');
      Sql.Add('   AND IDEVENTOGERADOR IN (13, 14)');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := iIdPessoa;
      Prepare;
      try
        Open;
      except
        Close;
        FreeAndNil(QryDtCanc);
        Exit;
      end;
      Result := QryDtCanc.FieldByName('dataevento').AsString;
    end;
  finally
    QryDtCanc.Close;
    FreeAndNil(QryDtCanc);
  end;
end;

function TfrmPExtratoDesligamento.RetornaDataDemissao(
  xIdPessoa: Integer): String;
var
  QryDtDemissao : TwwQuery;
begin
  QryDtDemissao := TwwQuery.Create(Self);
  QryDtDemissao.DataBaseName := 'BaseDados';

  try
    with QryDtDemissao do begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT datademissao');
      Sql.Add('  FROM elegpatro');
      Sql.Add(' WHERE idpessoa = :idpessoa');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := iIdPessoa;
      Prepare;
      try
        Open;
      except
        Close;
        FreeAndNil(QryDtDemissao);
        Exit;
      end;
      Result := QryDtDemissao.FieldByName('datademissao').AsString;
    end;

  finally
    QryDtDemissao.Close;
    FreeAndNil(QryDtDemissao);
  end;

end;

function TfrmPExtratoDesligamento.RetornaDataIncricao(
  xIdPessoa: Integer): String;
var
  QryDtInscricao : TwwQuery;
begin
{  QryDtInscricao := TwwQuery.Create(Nil);
  QryDtInscricao.DataBaseName := 'BaseDados';

  try
    with QryDtInscricao do begin
      Sql.Clear;
      Sql.Add('SELECT inscricaodata');
      Sql.Add('  FROM partprevplan');
      Sql.Add(' WHERE idpessoa = :idpessoa');
      Sql.Add('   AND idsitplanprev = 1');

      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := iIdPessoa;
    end;
    QryDtInscricao.Prepare;
    try
      QryDtInscricao.Open;
    except
      Close;
      FreeAndNil(QryDtInscricao);
      Exit;
    end;

    if (QryDtInscricao.FieldByName('inscricaodata').AsString = '') then begin
      with QryDtInscricao do begin
        Sql.Clear;
        Sql.Add('SELECT inscricaodata');
        Sql.Add('  FROM partprevplan');
        Sql.Add(' WHERE idpessoa = :idpessoa');

        Params.Clear;
        Params.CreateParam(ftInteger, 'idpessoa', ptInput);
        ParamByName('idpessoa').AsInteger := iIdPessoa;
      end;
      QryDtInscricao.Prepare;
      try
        QryDtInscricao.Open;
      except
        QryDtInscricao.Close;
        FreeAndNil(QryDtInscricao);
        Exit;
      end;
      Result := QryDtInscricao.FieldByName('inscricaodata').AsString;
    end
    else begin
      Result := QryDtInscricao.FieldByName('inscricaodata').AsString;
    end;
  finally
    QryDtInscricao.Close;
    FreeAndNil(QryDtInscricao);
  end;}
end;

function TfrmPExtratoDesligamento.RetornaQtdeMesesAutoPatrocinio(
  xIdPessoa: Integer): Integer;
var
  QryAutoPatrocinio : TwwQuery;
begin
  QryAutoPatrocinio              := TwwQuery.Create(Self);
  QryAutoPatrocinio.DatabaseName := 'BaseDados';

  try
    with qryAutoPatrocinio do begin
      Sql.Clear;
      Sql.Add('SELECT COUNT(DATAEVENTO) AS QTDE');
      Sql.Add('  FROM EVENTOSPREV');
      Sql.Add(' WHERE idpessoa = :idpessoa');
      Sql.Add('   AND ideventogerador IN (' + QuotedStr('3') + ','  + QuotedStr('9') + ','  + QuotedStr('16') + ')');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := xIdPessoa;
    end;
    qryAutoPatrocinio.Prepare;
    try
      qryAutoPatrocinio.Open;
    except
      qryAutoPatrocinio.Close;
      FreeAndNil(qryAutoPatrocinio);
    end;

    Result := qryAutoPatrocinio.FieldByName('QTDE').AsInteger;
  finally
    qryAutoPatrocinio.Close;
    FreeAndNil(qryAutoPatrocinio);
  end;
end;

Function TfrmPExtratoDesligamento.SubtrairMesesAutoPatrocinio (AnoMes : String; QtdeMes : Integer) : String;
var
  Mes : Integer;
  Ano : Integer;
  x   : Integer;
begin
  AnoMes := FormatDateTime('yyyy/mm',StrToDate(AnoMes));

  Ano := StrToInt(Copy(AnoMes,1,4));
  Mes := StrToInt(Copy(AnoMes,6,2));

  if Mes = 1 then begin
    Mes := 12;
    Dec(Ano);
  end;

  for x := 0 to QtdeMes do begin
    Dec(Mes);

    if Mes = 1 then begin
      Mes := 12;
      Dec(Ano);
    end;
  end;

  Result := '01/' + IntToStr(Mes) + '/' + IntToStr(Ano);
end;

function TfrmPExtratoDesligamento.Inscricao(xIdPessoa: Integer): String;
var
  QryDataInscricao : TwwQuery;
begin
  QryDataInscricao              := TwwQuery.Create(Self);
  QryDataInscricao.DatabaseName := 'BaseDados';

  try
    with QryDataInscricao do begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT inscricaodata');
      Sql.Add('  FROM partprevplan');
      Sql.Add(' WHERE idpessoa = ' + IntToStr(xIdPessoa));
      Sql.Add('   AND idsitplanoprev = 1');
      Open;
    end;

    if QryDataInscricao.FieldByName('inscricaodata').AsString = '' then begin
      with QryDataInscricao do begin
        Close; 
        Sql.Clear;
        Sql.Add('SELECT inscricaodata');
        Sql.Add('  FROM partprevplan');
        Sql.Add(' WHERE idpessoa = ' + IntToStr(xIdPessoa));
        Open;
      end;

      Result := QryDataInscricao.FieldByName('inscricaodata').AsString;
    end
    else begin
      Result := QryDataInscricao.FieldByName('inscricaodata').AsString;
    end;
  finally
    QryDataInscricao.Close;
    FreeAndNil(QryDataInscricao);
  end;
end;

//BRUNO AZEVEDO SOL 167335 - CARREGAR OS VALORES BRUTO DE RESERVA DO REB
function TfrmPExtratoDesligamento.ReservasResgataveisREB(pMatricula: String): Currency;
var
  xQryValor: TwwQuery;
begin
  Result := 0;

  try
    xQryValor := TwwQuery.Create(Application);
    xQryValor.DatabaseName := 'BaseDados';
    xQryValor.Sql.Clear;
    xQryValor.Sql.Add('SELECT MATRICULA, ');
    xQryValor.Sql.Add('       SUM(VALOR_RESGATAVEL) AS VALOR');
    xQryValor.Sql.Add('  FROM (SELECT CASE ');
    xQryValor.Sql.Add('                WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC ');
    xQryValor.Sql.Add('                WHERE  HC.IDPESSOA = PE.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') <= 10 AND DECODE(H.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'', ');
    xQryValor.Sql.Add('                52,''Participante'',53,''Participante'',60,''Patrocinadora'',61,''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 5');
    xQryValor.Sql.Add('                WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC ');
    xQryValor.Sql.Add('      WHERE  HC.IDPESSOA = PE.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 11 AND 15 AND DECODE(H.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',');
    xQryValor.Sql.Add('                52,''Participante'',53,''Participante'',60,''Patrocinadora'',61,''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 10');
    xQryValor.Sql.Add('                WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC ');
    xQryValor.Sql.Add('      WHERE  HC.IDPESSOA = PE.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 16 AND 20 AND DECODE(H.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',');
    xQryValor.Sql.Add('                52,''Participante'',53,''Participante'',60,''Patrocinadora'',61,''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 15');
    xQryValor.Sql.Add('                WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC ');
    xQryValor.Sql.Add('                WHERE  HC.IDPESSOA = PE.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') >= 21 AND DECODE(H.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'', ');
    xQryValor.Sql.Add('                52,''Participante'',53,''Participante'',60,''Patrocinadora'',61,''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 20');
    xQryValor.Sql.Add('                WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC ');
    xQryValor.Sql.Add('                WHERE  HC.IDPESSOA = PE.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') = 2 AND DECODE(H.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'', ');
    xQryValor.Sql.Add('                52,''Participante'',53,''Participante'',60,''Patrocinadora'',61,''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Entidade Fechada'' THEN 0');
    xQryValor.Sql.Add('                ELSE 100');
    xQryValor.Sql.Add('               END AS PERCENTUAL_RESGATE,');
    xQryValor.Sql.Add('               ((SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, -H.VLRCOTAS)) * CC.COTVALOR) *');
    xQryValor.Sql.Add('                  (CASE');
    xQryValor.Sql.Add('                    WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC ');
    xQryValor.Sql.Add('      WHERE  HC.IDPESSOA = PE.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') <= 10 AND DECODE(H.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',');
    xQryValor.Sql.Add('                    52,''Participante'',53,''Participante'',60,''Patrocinadora'',61,''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 5');
    xQryValor.Sql.Add('                    WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC ');
    xQryValor.Sql.Add('      WHERE  HC.IDPESSOA = PE.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 11 AND 15 AND DECODE(H.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',');
    xQryValor.Sql.Add('                    52,''Participante'',53,''Participante'',60,''Patrocinadora'',61,''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 10');
    xQryValor.Sql.Add('                    WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC ');
    xQryValor.Sql.Add('      WHERE  HC.IDPESSOA = PE.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') BETWEEN 16 AND 20 AND DECODE(H.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',');
    xQryValor.Sql.Add('                    52,''Participante'',53,''Participante'',60,''Patrocinadora'',61,''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Patrocinadora'' THEN 15');
    xQryValor.Sql.Add('                    WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC ');
    xQryValor.Sql.Add('                 WHERE  HC.IDPESSOA = PE.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') >= 21 AND DECODE(H.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'',');
    xQryValor.Sql.Add('                    52,''Participante'',53,''Participante'',60,''Patrocinadora'',61,''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'')  = ''Patrocinadora'' THEN 20');
    xQryValor.Sql.Add('                    WHEN (SELECT /*+RULE*/TRUNC((TO_DATE(MAX(HC.MESREFERENCIA),''YYYY/MM'')- TO_DATE(MIN(HC.MESREFERENCIA),''YYYY/MM''))/365.25) FROM HSTCONTRIBPREV HC ');
    xQryValor.Sql.Add('                    WHERE  HC.IDPESSOA = PE.IDPESSOA AND SUBSTR(HC.MESREFERENCIA,6,7) <>''13'') = 2 AND DECODE(H.IDTIPORESERVA,55,''Participante'',79,''Participante'',62,''Patrocinadora'',23,''Participante'',33,''Patrocinadora'',51,''Participante'',59,''Patrocinadora'', ');
    xQryValor.Sql.Add('                    52,''Participante'',53,''Participante'',60,''Patrocinadora'',61,''Patrocinadora'',117,''Entidade Aberta'',134,''Entidade Fechada'',167,''Patro Total'',170,''Patrocinadora'',''NC'') = ''Entidade Fechada'' THEN 0');
    xQryValor.Sql.Add('                    ELSE 100');
    xQryValor.Sql.Add('                   END / 100)) AS VALOR_RESGATAVEL,');
    xQryValor.Sql.Add('               EL.MATRICULA AS MATRICULA');
    xQryValor.Sql.Add('          FROM HISTMOVRESERVA H,');
    xQryValor.Sql.Add('               RESERVAXPLANO TP,');
    xQryValor.Sql.Add('               PESSOA PE,');
    xQryValor.Sql.Add('               ELEGPATRO EL,');
    xQryValor.Sql.Add('               PARTPREVPLAN PP,');
    xQryValor.Sql.Add('               COTACAOMOEDA CC');
    xQryValor.Sql.Add('         WHERE PP.IDPLANOPREV = H.IDPLANOPREV');
    xQryValor.Sql.Add('           AND (H.IDPESSOA = PE.IDPESSOA)');
    xQryValor.Sql.Add('           AND H.IDPESSOA NOT IN (SELECT IDPESSOA FROM PARTPREVPLAN WHERE IDPLANOPREV = 2 AND IDSITPLANOPREV = 1)');
    xQryValor.Sql.Add('           AND (H.IDPESSOA = EL.IDPESSOA AND H.IDPESSJUR = EL.IDPESSJUR)');
    xQryValor.Sql.Add('           AND (H.IDPESSOA = PP.IDPESSOA AND H.IDPESSJUR = PP.IDPESSJUR)');
    xQryValor.Sql.Add('           AND (H.SEQPROPOSTA = 1)');
    xQryValor.Sql.Add('           AND (H.IDPLANOPREV = TP.IDPLANOPREV)');
    xQryValor.Sql.Add('           AND (H.IDTIPORESERVA = TP.IDTIPORESERVA)');
    xQryValor.Sql.Add('           AND (TP.ANALITICOSINTETI = ''A'' AND TP.FLGCONTROLE = 0 AND TP.FLGCOLETIVA = 0)');
    xQryValor.Sql.Add('           AND ((H.IDPLANOPREV IN (66) AND SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'')) OR (H.IDPLANOPREV = 66 AND SUBSTR(TP.CODHIERARQUIA, 1, 2) IN (''11'', ''12'')))');
    xQryValor.Sql.Add('           AND CC.MOECODIGO = TP.INDICEREAJUSTE');
    xQryValor.Sql.Add('           AND NOT EXISTS (SELECT 1');
    xQryValor.Sql.Add('                             FROM PARTPREVPLAN PP2');
    xQryValor.Sql.Add('                            WHERE PP2.IDPLANOPREV = 19');
    xQryValor.Sql.Add('                              AND PP2.IDPESSOA = EL.IDPESSOA');
    xQryValor.Sql.Add('                              AND PP2.IDPESSJUR = EL.IDPESSJUR)');
    xQryValor.Sql.Add('           AND CC.COTDATA = (SELECT MAX(COTDATA)');
    xQryValor.Sql.Add('                               FROM COTACAOMOEDA CM');
    xQryValor.Sql.Add('                              WHERE CM.MOECODIGO = CC.MOECODIGO)');
    xQryValor.Sql.Add('           AND (EL.MATRICULA = :MATRICULA)');
    xQryValor.Sql.Add('     GROUP BY H.IDTIPORESERVA,');
    xQryValor.Sql.Add('              H.DATAALIMENTACAO,');
    xQryValor.Sql.Add('              PE.IDPESSOA,');
    xQryValor.Sql.Add('              EL.MATRICULA,');
    xQryValor.Sql.Add('              CC.COTVALOR)');
    xQryValor.Sql.Add(' GROUP BY MATRICULA');
    xQryValor.ParamByName('MATRICULA').AsString := pMatricula;
    xQryValor.Open;

    if not(xQryValor.IsEmpty) then begin
      Result := xQryValor.FieldByName('VALOR').AsFloat;
    end;
  finally
    FreeAndNil(xQryValor);
  end;
end;

//BRUNO AZEVEDO SOL 167335 - CARREGAR OS VALORES BRUTO DE RESERVA DO NOVO PLANO
function TfrmPExtratoDesligamento.ReservasResgataveisNOVOPLANO(pMatricula: String): Currency;
var
  xQryValor: TwwQuery;
begin
  Result := 0;

  try
    xQryValor := TwwQuery.Create(Application);
    xQryValor.DatabaseName := 'BaseDados';
    xQryValor.Sql.Clear;
    xQryValor.Sql.Add('SELECT EL.MATRICULA, ');
    xQryValor.Sql.Add('       SUM((DECODE(H.FLGENTRADA,1,(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)),-(DECODE(H.IDTIPORESERVA, 111,0, H.VLRCOTAS)))) * (SELECT DECODE(TP.FLGCONTROLE,1, 0, COTVALOR) FROM COTACAOMOEDA M1 ');
    xQryValor.Sql.Add('       WHERE M1.MOECODIGO = TP.INDICEREAJUSTE AND M1.COTDATA = (SELECT MAX(COTDATA) FROM COTACAOMOEDA M2 WHERE M2.MOECODIGO = TP.INDICEREAJUSTE))) AS VALOR_RESGATAVEL ');
    xQryValor.Sql.Add('  FROM HISTMOVRESERVA H, ');
    xQryValor.Sql.Add('       RESERVAXPLANO TP, ');
    xQryValor.Sql.Add('       PESSOA PE, ');
    xQryValor.Sql.Add('       ELEGPATRO EL, ');
    xQryValor.Sql.Add('       COTACAOMOEDA CC ');
    xQryValor.Sql.Add(' WHERE (H.IDPESSOA = PE.IDPESSOA) ');
    xQryValor.Sql.Add('   AND (H.IDPESSOA = EL.IDPESSOA AND H.IDPESSJUR = EL.IDPESSJUR ) ');
    xQryValor.Sql.Add('   AND (H.SEQPROPOSTA = 1) ');
    xQryValor.Sql.Add('   AND (H.IDPLANOPREV = TP.IDPLANOPREV) ');
    xQryValor.Sql.Add('   AND h.idtiporeserva IN (100,101,110,111) ');
    xQryValor.Sql.Add('   AND (H.IDTIPORESERVA = TP.IDTIPORESERVA) ');
    xQryValor.Sql.Add('   AND (TP.ANALITICOSINTETI = ''A'' AND TP.FLGCOLETIVA = 0) ');
    xQryValor.Sql.Add('   AND ((H.IDPLANOPREV =74 ) OR (H.IDPLANOPREV = 74 )) ');
    xQryValor.Sql.Add('   AND CC.MOECODIGO  = tp.INDICEREAJUSTE ');
    xQryValor.Sql.Add('   AND CC.COTDATA = (SELECT MAX(COTDATA) FROM COTACAOMOEDA CM WHERE CM.MOECODIGO = CC.MOECODIGO) ');
    xQryValor.Sql.Add('   AND (EL.MATRICULA = :MATRICULA) ');
    xQryValor.Sql.Add(' GROUP BY EL.MATRICULA ');
    xQryValor.ParamByName('MATRICULA').AsString := pMatricula;
    xQryValor.Open;

    if not(xQryValor.IsEmpty) then begin
      Result := xQryValor.FieldByName('VALOR_RESGATAVEL').AsFloat;
    end;
  finally
    FreeAndNil(xQryValor);
  end;
end;

//BRUNO AZEVEDO SOL 167335 - CARREGAR OS VALORES BRUTO DE RESERVA DO REGREPLAN
function TfrmPExtratoDesligamento.ReservasREGREPLAN(pMatricula: String; pFlgResgatavel: Boolean): Currency;
var
  xQryValor: TwwQuery;
begin
  Result := 0;

  try
    xQryValor := TwwQuery.Create(Application);
    xQryValor.DatabaseName := 'BaseDados';
    xQryValor.Sql.Clear;
    xQryValor.Sql.Add('SELECT DISTINCT ');
    xQryValor.Sql.Add('       DECODE(H.IDTIPORESERVA,3,''COM DEDUÇÃO DE IRRF'',73,''SEM DEDUÇÃO DE IRRF'', ''NC'') TIPO_RESERVA, ');
    xQryValor.Sql.Add('       EL.MATRICULA, ');
    xQryValor.Sql.Add('       (SUM(DECODE(H.FLGENTRADA, 1, H.VLRCOTAS, -H.VLRCOTAS))*CC.COTVALOR) AS VALOR_RESGATAVEL ');
    xQryValor.Sql.Add('FROM HISTMOVRESERVA H, ');
    xQryValor.Sql.Add('     RESERVAXPLANO TP, ');
    xQryValor.Sql.Add('     ELEGPATRO EL, ');
    xQryValor.Sql.Add('     COTACAOMOEDA CC ');
    xQryValor.Sql.Add('WHERE  NVL(TP.FLGCONTROLE,0) <> 1 ');
    xQryValor.Sql.Add('      AND (H.IDPESSOA = EL.IDPESSOA AND H.IDPESSJUR = EL.IDPESSJUR ) ');
    xQryValor.Sql.Add('      AND (H.SEQPROPOSTA = 1) ');
    xQryValor.Sql.Add('      AND (H.IDPLANOPREV = TP.IDPLANOPREV) ');
    xQryValor.Sql.Add('      AND (H.IDTIPORESERVA = TP.IDTIPORESERVA) ');
    xQryValor.Sql.Add('      AND (TP.ANALITICOSINTETI = ''A'' AND TP.FLGCONTROLE = 0 AND TP.FLGCOLETIVA = 0) ');
    xQryValor.Sql.Add('      AND ((H.IDPLANOPREV = 2 AND SUBSTR(TP.CODHIERARQUIA,1,2) IN (''11'', ''12'')) OR (H.IDPLANOPREV = 2 AND SUBSTR(TP.CODHIERARQUIA,1,2) IN (''11'',''12''))) ');
    xQryValor.Sql.Add('      AND CC.MOECODIGO  = TP.INDICEREAJUSTE ');
    xQryValor.Sql.Add('      AND CC.COTDATA = (SELECT MAX(COTDATA) ');
    xQryValor.Sql.Add('                        FROM COTACAOMOEDA CM ');
    xQryValor.Sql.Add('                        WHERE CM.MOECODIGO = CC.MOECODIGO) ');
    xQryValor.Sql.Add('      AND (EL.MATRICULA = :MATRICULA) '); 
    if (pFlgResgatavel) then begin 
      xQryValor.Sql.Add('      AND (H.IDTIPORESERVA = 3) ');
    end else begin
      xQryValor.Sql.Add('      AND (H.IDTIPORESERVA = 73) ');
    end;
    xQryValor.Sql.Add('GROUP BY EL.MATRICULA, ');
    xQryValor.Sql.Add('       H.IDTIPORESERVA, ');
    xQryValor.Sql.Add('       CC.COTVALOR ');
    xQryValor.ParamByName('MATRICULA').AsString := pMatricula;
    xQryValor.Open;

    if not(xQryValor.IsEmpty) then begin
      Result := xQryValor.FieldByName('VALOR_RESGATAVEL').AsFloat;
    end;
  finally
    FreeAndNil(xQryValor);
  end;
end;

//BRUNO AZEVEDO SOL 167335 - CALCULO DO IR PARA REGREPLAN
function TfrmPExtratoDesligamento.CalculoIrrfRegReplan(pMatricula: String; pValorBruto: Double): Currency;
var
  xObjIRRF: TCtrlObjIrrf;
  xQryValor: TwwQuery;
  dDataNasc: TDateTime;
  dPercentual: Double;
begin
  Result := 0;
  try
    xObjIRRF := TCtrlObjIrrf.Create();

    try
      xQryValor := TwwQuery.Create(Application);
      xQryValor.DatabaseName := 'BaseDados';
      xQryValor.Sql.Clear;
      xQryValor.Sql.Add('SELECT DATANASC FROM PESSOAFISICA');
      xQryValor.Sql.Add('WHERE IDPESSOA = (SELECT IDPESSOA FROM DEPENTIT WHERE MATRICULA = ' + QuotedStr(pMatricula) + ')');
      xQryValor.Open;

      dDataNasc := xQryValor.FieldByName('DATANASC').AsDateTime;
    finally
      FreeAndNil(xQryValor);
    end;

    Result := xObjIRRF.CalculaIRRF(0, dDataNasc, pValorBruto, dPercentual, DateToStr(Date), 0);
  finally
    FreeAndNil(xObjIRRF);
  end;
end;

//BRUNO AZEVEDO SOL 167335 - CARREGA INDICE CUSTEIO ADMINISTRATIVO E CUSTEIO DE RISCO
function TfrmPExtratoDesligamento.CarregaIndiceAdmRisco(pTabela, pCodCampo: String): Double;
var
  xQryValor: TwwQuery;
  sValor: String;
begin
  Result := 0;

  try
    xQryValor := TwwQuery.Create(Application);
    xQryValor.DatabaseName := 'BaseDados';
    xQryValor.Sql.Clear;
    xQryValor.Sql.Add('SELECT VALOR ');
    xQryValor.Sql.Add('  FROM VALTABGENER');
    xQryValor.Sql.Add(' WHERE CODTABELA = ' + QuotedStr(pTabela));
    xQryValor.Sql.Add('   AND CODCAMPO = '+ QuotedStr(pCodCampo));                   
    xQryValor.Sql.Add('   AND NUMLINHA = ');
    xQryValor.Sql.Add('       (SELECT NUMLINHA');
    xQryValor.Sql.Add('          FROM VALTABGENER');
    xQryValor.Sql.Add('         WHERE CODTABELA = ' + QuotedStr(pTabela));    
    xQryValor.Sql.Add('           AND CODCAMPO = ''DATA''');
    xQryValor.Sql.Add('           AND VALOR = (SELECT MAX(TO_DATE(VALOR))');
    xQryValor.Sql.Add('                          FROM VALTABGENER');
    xQryValor.Sql.Add('                         WHERE CODTABELA = ' + QuotedStr(pTabela));    
    xQryValor.Sql.Add('                           AND CODCAMPO = ''DATA''))');
    xQryValor.Open;

    if not(xQryValor.IsEmpty) then begin
      sValor := xQryValor.FieldByName('VALOR').AsString;
      Result := StrToFloat(StringReplace(sValor, '.', ',', []));
    end;
  finally
    FreeAndNil(xQryValor);
  end;
end;

Function TfrmPExtratoDesligamento.EventoBPD (xIdPessoa : Integer) : Boolean;
var
  qryElegibilidade : TwwQuery;
begin
  qryElegibilidade := TwwQuery.Create(Self);
  qryElegibilidade.DataBaseName := 'BaseDados';

  Resgate         := True;
  Portabilidade   := True;

  try
    // Verificando Elegibilidade Resgate

    with qryElegibilidade do begin
      Sql.Clear;
      Sql.Add('SELECT IDPESSOA');
      Sql.Add('  FROM EVENTOSPREV');
      Sql.Add(' WHERE idpessoa = :idpessoa');
      Sql.Add('   AND ideventogerador IN (' + QuotedStr('17') + ','  + QuotedStr('341') + ')');
      Params.Clear;
      Params.CreateParam(ftInteger, 'idpessoa', ptInput);
      ParamByName('idpessoa').AsInteger := xIdPessoa;
    end;
    qryElegibilidade.Prepare;
    try
      qryElegibilidade.Open;
    except
      qryElegibilidade.Close;
      FreeAndNil(qryElegibilidade);
      MessageBox(0, PChar('Problemas para verificar regras de elegibilidade do portador'), 'RESGATE', MB_OK + MB_ICONERROR);
    end;
    if (not qryElegibilidade.IsEmpty) then
    begin
      Result := True;
    end
    else begin
      Result := False;
    end;
  finally
    qryElegibilidade.Close;
    FreeAndNil(qryElegibilidade);
  end;
end;

end.
