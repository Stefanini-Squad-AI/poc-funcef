unit fSelPess;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  Db, DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, DBClient,
  wwdbdatetimepicker, CMDateTimePicker, uCmSqlParams, uCMClientDataSet, CmParamReport,
  uCtrlReqPessoal, uCtrlCargo, uCtrlCursoReq, uCtrlRegTrein, uCtrlCurso, uCtrlAvalReq,
  uCtrlExpReq, uCtrlPesoFatGrp, uCtrlRegExp, uCtrlRegAval, uCtrlRegDesemp, uCtrlTipAval;

type
  TfrmSelPess = class(TfrmSelPessoalMT)
    dbgrPessoal: TwwDBGrid;
    dsCargo2: TwwDataSource;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    sbtnFicha: TSpeedButton;
    sbtnLista: TSpeedButton;
    sbtnAssoc: TSpeedButton;
    CdsCargo2: TCMClientDataSet;
    CdsCursoReq: TCMClientDataSet;
    CdsHstTrn: TCMClientDataSet;
    CdsExperReqCargo: TCMClientDataSet;
    CdsAvalReqCargo: TCMClientDataSet;
    CdsPesos: TCMClientDataSet;
    CdsHstExper: TCMClientDataSet;
    CdsHstAval: TCMClientDataSet;
    CdsHstDesemp: TCMClientDataSet;
    CdsCurso: TCMClientDataSet;
    CdsTipAval: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure sbtnFichaClick(Sender: TObject);
    procedure sbtnListaClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnAssocClick(Sender: TObject);
    procedure CdsPrincipalFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CtrlReqPessoal: TCtrlReqPessoal;
    CtrlCargo: TCtrlCargo;
    CtrlCursoReq: TCtrlCursoReq;
    CtrlRegTrein: TCtrlRegTrein;
    CtrlCurso: TCtrlCurso;
    CtrlAvalReq: TCtrlAvalReq;
    CtrlExpReq: TCtrlExpReq;
    CtrlPesoFatGrp: TCtrlPesoFatGrp;
    CtrlRegExp: TCtrlRegExp;
    CtrlRegAval: TCtrlRegAval;
    CtrlRegDesemp: TCtrlRegDesemp;
    CtrlTipAval: TCtrlTipAval;

    DataFinal: TDateTime;
    NumFinal: integer;

    procedure SelDetalhes;
    procedure IniciarDados;
  public
    ListaIdCurso, ListIdExper, ListaIdTipAval, ListaSinalTrein,
    ListaNotaTeorica, ListaNotaPratica, ListaSinalExper,
    ListaMesesMinExper, ListaSinalAval, ListaIMinAval: TStringList;

    NumReq: double;
    TipoSelTreinRequerido: integer;
    TipoSelExperiencia: integer;
    TipoSelTipoAvaliacoes: integer;
    AvalTeorica: integer;
    AvalPratica: integer;
    AprovacaoPadrao: boolean;
    SimulaDesempenho: boolean;
    SelReqPessoal: boolean;
    CandAssociados: boolean;
    CodGrupo: string;
    SinalDesempenho: string;
    DesempenhoMin: string;
    SinalTipoSelTreinRequerido: string;
    SinalTipoExperiencia: string;
    SinalTipoAvaliacoes: string;
  end;

var
  frmSelPess: TfrmSelPess;

implementation

uses uSistema, uMensErro, uCtrlPadroes, fAguarde, RPotencCandReq, fParamFichaFunc,
  fParamDossieCand, uCtrlFuncoesRH, uCtrlUsoGeralRH, RFichaFunc, RDossieCand, dCds;

const
  // Constantes para o tipo de seleção das avaliações
  PADRAO_CARGO = 0;
  SEM_EXIGENCIA = 1;
  A_SELECIONAR = 2;

{$R *.DFM}

procedure TfrmSelPess.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlReqPessoal := TCtrlReqPessoal.Create(Sistema.UsaRAD, Sistema.IdEmpresa);
  CtrlReqPessoal.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlCursoReq := TCtrlCursoReq.Create;
  CtrlCursoReq.InitializeAs(Padroes);

  CtrlRegTrein := TCtrlRegTrein.Create(false, false, false, false, 0, 0, '',
    CtrlUsoGeralRH.UsuXFilial, CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlRegTrein.InitializeAs(Padroes);

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  CtrlAvalReq := TCtrlAvalReq.Create;
  CtrlAvalReq.InitializeAs(Padroes);

  CtrlExpReq := TCtrlExpReq.Create;
  CtrlExpReq.InitializeAs(Padroes);

  CtrlPesoFatGrp := TCtrlPesoFatGrp.Create;
  CtrlPesoFatGrp.InitializeAs(Padroes);

  CtrlRegExp := TCtrlRegExp.Create;
  CtrlRegExp.InitializeAs(Padroes);

  CtrlRegAval := TCtrlRegAval.Create;
  CtrlRegAval.InitializeAs(Padroes);

  CtrlRegDesemp := TCtrlRegDesemp.Create;
  CtrlRegDesemp.InitializeAs(Padroes);

  CtrlTipAval := TCtrlTipAval.Create;
  CtrlTipAval.InitializeAs(Padroes);

  ListaIdCurso := TStringList.Create;
  ListIdExper := TStringList.Create;
  ListaIdTipAval := TStringList.Create;
  ListaSinalTrein := TStringList.Create;
  ListaNotaTeorica := TStringList.Create;
  ListaNotaPratica := TStringList.Create;
  ListaSinalExper := TStringList.Create;
  ListaMesesMinExper := TStringList.Create;
  ListaSinalAval := TStringList.Create;
  ListaIMinAval := TStringList.Create;

  IniciarDados;
end;

procedure TfrmSelPess.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlReqPessoal);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlCursoReq);
  FreeAndNil(CtrlRegTrein);
  FreeAndNil(CtrlAvalReq);
  FreeAndNil(CtrlExpReq);
  FreeAndNil(CtrlPesoFatGrp);
  FreeAndNil(CtrlRegExp);
  FreeAndNil(CtrlRegAval);
  FreeAndNil(CtrlRegDesemp);
  FreeAndNil(CtrlTipAval);
  FreeAndNil(ListaIdCurso);
  FreeAndNil(ListIdExper);
  FreeAndNil(ListaIdTipAval);
  FreeAndNil(ListaSinalTrein);
  FreeAndNil(ListaNotaTeorica);
  FreeAndNil(ListaNotaPratica);
  FreeAndNil(ListaSinalExper);
  FreeAndNil(ListaMesesMinExper);
  FreeAndNil(ListaSinalAval);
  FreeAndNil(ListaIMinAval);
  inherited;
end;

procedure TfrmSelPess.FormShow(Sender: TObject);
begin
  inherited;
  if (SelReqPessoal) then // Ver Dados da Requisição
  begin
    dmCds.Cds.Data := CtrlReqPessoal.ListRequisicao(NumReq);
    if not(dmCds.Cds.IsEmpty) then
    begin
      cbxMasculino.Checked := (dmCds.Cds.FieldByName('SEXO').asString[1] in ['M','I']);
      cbxFeminino.Checked := (dmCds.Cds.FieldByName('SEXO').asString[1] in ['F','I']);

      cbxEfetivos.Checked := (dmCds.Cds.FieldByName('TIPOCONTRATO').asString[1] = '0');
      cbxEspeciais.Checked := (dmCds.Cds.FieldByName('TIPOCONTRATO').asString[1] = '0');
      cbxTemporarios.Checked := (dmCds.Cds.FieldByName('TIPOCONTRATO').asString[1] = '1');
      cbxEstagiarios.Checked := (dmCds.Cds.FieldByName('TIPOCONTRATO').asString[1] = '2');

      if not(dmCds.Cds.FieldByName('IDCARGO').IsNull) then
      begin
        rgSelCargo.ItemIndex := 1;
        sqlCargo.Open;
        CdsCargo.Locate('IDCARGO', dmCds.Cds.FieldByName('IDCARGO').asFloat, []);
        dblckCargo.LookupValue := CdsCargo.FieldByName('IDCARGO').asString;
        dblckCargo.Update;
        dblckCargoCloseUp(nil, nil, nil, true);
      end;

      if not(dmCds.Cds.FieldByName('IDGRINSTR').IsNull) then
      begin
        rgSinal.ItemIndex := 2;
        sqlGrauInstr.Open;
        CdsGrauInstr.Locate('IDGRINSTR', dmCds.Cds.FieldByName('IDGRINSTR').asFloat, []);
        dblckGrauInstr.LookupValue := CdsGrauInstr.FieldByName('IDGRINSTR').asString;
        dblckGrauInstr.Update;
        dblckGrauInstrCloseUp(dblckGrauInstr, nil, nil, true);
      end;
    end;
  end;
end;

procedure TfrmSelPess.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  sbtnFicha.Visible := false;
  sbtnLista.Visible := false;
  sbtnAssoc.Visible := false;
  Toolbar971.Visible := false;
  ModalResult := mrNone;
end;

procedure TfrmSelPess.CdsPrincipalFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  MinTeor, MinPrat, c: integer;
  TempoExp, CodAux: real;
begin
  inherited;
  if not(Accept) then
    exit;

  // Ver Candidatos Associados à Requisição
  if (SelReqPessoal) and (CandAssociados) and (cbxCandidatos.Checked) then
  begin
    dmCds.Cds.Data := CtrlReqPessoal.ListReqCand(NumReq,
      CdsPrincipal.FieldByName('IDPESSOA').asFloat);
    if (dmCds.Cds.IsEmpty) then
    begin
      Accept := false;
      exit;
    end;
  end;

  SelDetalhes;

  if (TipoSelTreinRequerido <> SEM_EXIGENCIA) then // Ver Cursos
  begin
    MinTeor := AvalTeorica;
    MinPrat := AvalPratica;

    if (TipoSelTreinRequerido = PADRAO_CARGO) then
    begin
      CdsCursoReq.First;
      while not(CdsCursoReq.EOF) do
      begin
        Accept := false;
        if (CdsHstTrn.Locate('IDPESSOA;IDCURSO',VarArrayOf(
            [CdsPrincipal.FieldByName('IDPESSOA').asFloat,
             CdsCursoReq.FieldByName('IDCURSO').asFloat]), [])) then
        begin
          CdsCurso.Filter := 'IDCURSO = ' + CdsHstTrn.FieldByName('IDCURSO').asString;
          CdsCurso.Filtered := true;
        end
        else
          exit;

        while (CdsHstTrn.FieldByName('IDPESSOA').asFloat =
               CdsPrincipal.FieldByName('IDPESSOA').asFloat) and
              (CdsHstTrn.FieldByName('IDCURSO').asFloat =
               CdsCursoReq.FieldByName('IDCURSO').asFloat) and
              not(CdsHstTrn.EOF) do
        begin
          Accept := true;
          if (AprovacaoPadrao) then
          begin
            MinTeor := CdsCurso.FieldByName('AVALIACAO').asInteger;
            MinPrat := CdsCurso.FieldByName('AVALPRAT').asInteger;
          end;

          if (CdsHstTrn.FieldByName('IDCURSO').asFloat <>
              CdsCurso.FieldByName('IDCURSO').asFloat) or
             (CdsHstTrn.FieldByName('DATREFIM').asDateTime = 0) or
             (
               (CdsHstTrn.FieldByName('FLGAVALTEOR').asInteger = 1) and
               (
                 (CdsCurso.FieldByName('TEMAVAL').asInteger = 1) or not(AprovacaoPadrao)) and
               (
                 (
                   (SinalTipoSelTreinRequerido = '>=') and
                   (CdsHstTrn.FieldByName('AVALTEOR').asInteger < MinTeor)
                 ) or
                 (
                   (SinalTipoSelTreinRequerido = '=') and
                   (CdsHstTrn.FieldByName('AVALTEOR').asInteger <> MinTeor)
                 ) or
                 (
                   (SinalTipoSelTreinRequerido = '<') and
                   (CdsHstTrn.FieldByName('AVALTEOR').asInteger >= MinTeor)
                 )
               )
             ) or
             (
               (CdsHstTrn.FieldByName('FLGAVALPRAT').asInteger = 1) and
               ((CdsCurso.FieldByName('TEMAVPR').asInteger = 1) or not(AprovacaoPadrao)) and
               (
                 (
                   (SinalTipoSelTreinRequerido = '>=') and
                   (CdsHstTrn.FieldByName('AVALPRAT').asInteger < MinPrat)
                 ) or
                 (
                   (SinalTipoSelTreinRequerido = '=') and
                   (CdsHstTrn.FieldByName('AVALPRAT').asInteger <> MinPrat)
                 ) or
                 (
                   (SinalTipoSelTreinRequerido = '<') and
                   (CdsHstTrn.FieldByName('AVALPRAT').asInteger >= MinPrat)
                 )
               )
             ) then
            Accept := false
          else
            break;

          CdsHstTrn.Next;
        end;
        
        if not(Accept) then
          exit;

        CdsCursoReq.Next;
      end;
    end;

    if (TipoSelTreinRequerido = A_SELECIONAR) and (ListaIdCurso.Count > 0) then
    begin
      for c:=0 to ListaIdCurso.Count-1 do
      begin
        CodAux := StrToFloat(ListaIdCurso[c]);
        Accept := false;
        if (CdsHstTrn.Locate('IDPESSOA;IDCURSO',
            VarArrayOf([CdsPrincipal.FieldByName('IDPESSOA').asFloat, CodAux]), [])) then
        begin
          CdsCurso.Filter := 'IDCURSO = ' + CdsHstTrn.FieldByName('IDCURSO').asString;
          CdsCurso.Filtered := true;
        end
        else
          exit;

        while (CdsHstTrn.FieldByName('IDPESSOA').asFloat =
               CdsPrincipal.FieldByName('IDPESSOA').asFloat) and
              (CdsHstTrn.FieldByName('IDCURSO').asFloat = CodAux) and not(CdsHstTrn.EOF) do
        begin
          Accept := true;
          if (AprovacaoPadrao) then
          begin
            MinTeor := CdsCurso.FieldByName('AVALIACAO').asInteger;
            MinPrat := CdsCurso.FieldByName('AVALPRAT').asInteger;
          end
          else
          begin
            MinTeor := FU.StrInt(ListaNotaTeorica[c]);
            MinPrat := FU.StrInt(ListaNotaPratica[c]);
          end;

          if (CdsHstTrn.FieldByName('IDCURSO').asFloat <>
              CdsCurso.FieldByName('IDCURSO').asFloat) or
             (CdsHstTrn.FieldByName('DATREFIM').asInteger = 0) or
             (
               (CdsHstTrn.FieldByName('FLGAVALTEOR').asInteger = 1) and
               (
                 (CdsCurso.FieldByName('TEMAVAL').asInteger = 1) or not(AprovacaoPadrao)
               ) and
               (
                 (
                   (ListaSinalTrein[c] = '>=') and
                   (CdsHstTrn.FieldByName('AVALTEOR').asInteger < MinTeor)
                 ) or
                 (
                   (ListaSinalTrein[c] = '=') and
                   (CdsHstTrn.FieldByName('AVALTEOR').asInteger <> MinTeor)
                 ) or
                 (
                   (ListaSinalTrein[c] = '<') and
                   (CdsHstTrn.FieldByName('AVALTEOR').asInteger >= MinTeor)
                 )
               )
             ) or
             (
               (CdsHstTrn.FieldByName('FLGAVALPRAT').asInteger = 1) and
               (
                 (CdsCurso.FieldByName('TEMAVPR').asInteger = 1) or not(AprovacaoPadrao)
               ) and
               (
                 (
                   (ListaSinalTrein[c] = '>=') and
                   (CdsHstTrn.FieldByName('AVALPRAT').asInteger < MinPrat)
                 ) or
                 (
                   (ListaSinalTrein[c] = '=') and
                   (CdsHstTrn.FieldByName('AVALPRAT').asInteger <> MinPrat)
                 ) or
                 (
                   (ListaSinalTrein[c] = '<') and
                   (CdsHstTrn.FieldByName('AVALPRAT').asInteger >= MinPrat)
                 )
               )
             ) then
            Accept := false
          else
            break;

          CdsHstTrn.Next;
        end;

        if not(Accept) then
          exit;
      end;
    end;
  end;

  if (TipoSelExperiencia <> 3) then
  begin
    if (TipoSelExperiencia < 3) then // Padrão
    begin
      CdsExperReqCargo.First;
      while not(CdsExperReqCargo.EOF) do
      begin
        if ((TipoSelExperiencia = 1) and
            (CdsExperReqCargo.FieldByName('FLGIMPRESCIND').asInteger <> 0)) or
           ((TipoSelExperiencia = 2) and
            (CdsExperReqCargo.FieldByName('FLGIMPRESCIND').asInteger <> 1)) then
        begin
          CdsExperReqCargo.Next;
          continue;
        end;

        TempoExp := 0;
        Accept := false;
        if not(CdsHstExper.Locate('IDPESSOA;IDEXPER',
               VarArrayOf([CdsPrincipal.FieldByName('IDPESSOA').asFloat,
                           CdsExperReqCargo.FieldByName('IDEXPER').asFloat]), [])) then
          exit;

        while (CdsHstExper.FieldByName('IDPESSOA').asFloat =
               CdsPrincipal.FieldByName('IDPESSOA').asFloat) and
              (CdsHstExper.FieldByName('IDEXPER').asFloat =
               CdsExperReqCargo.FieldByName('IDEXPER').asFloat) and
              not(CdsHstExper.EOF) do
        begin
          if (CdsHstExper.FieldByName('DAT_FIM').asDateTime > 0) then
            DataFinal := CdsHstExper.FieldByName('DAT_FIM').asDateTime
          else
            DataFinal := Date;
            
          TempoExp := TempoExp + Round((DataFinal -
            CdsHstExper.FieldByName('DAT_INI').asDateTime) * 12 / 365.25);
          CdsHstExper.Next;
        end;

        if ((SinalTipoExperiencia = '>=') and
            (TempoExp <  CdsExperReqCargo.FieldByName('TEMPOEXPER').asFloat)) or
           ((SinalTipoExperiencia = '=') and
            (TempoExp <> CdsExperReqCargo.FieldByName('TEMPOEXPER').asFloat)) or
           ((SinalTipoExperiencia = '<') and
            (TempoExp >= CdsExperReqCargo.FieldByName('TEMPOEXPER').asFloat)) then
          exit
        else
          Accept := true;

        CdsExperReqCargo.Next;
      end;
    end;
    
    if (TipoSelExperiencia = 4) and (ListIdExper.Count > 0) then // Exp. Indicadas
    begin
      for c:=0 to ListIdExper.Count-1 do
      begin
        Accept := false;
        CodAux := StrToFloat(ListIdExper[c]);
        MinTeor := StrToInt(ListaMesesMinExper[c]);

        if not(CdsHstExper.Locate('IDPESSOA;IDEXPER',
               VarArrayOf([CdsPrincipal.FieldByName('IDPESSOA').asFloat, CodAux]), [])) then
          exit;

        TempoExp := 0;  
        while (CdsHstExper.FieldByName('IDPESSOA').asFloat =
               CdsPrincipal.FieldByName('IDPESSOA').asFloat) and
              (CdsHstExper.FieldByName('IDEXPER').asFloat = CodAux) and not(CdsHstExper.EOF) do
        begin
          if (CdsHstExper.FieldByName('DAT_FIM').asDateTime > 0) then
            DataFinal := CdsHstExper.FieldByName('DAT_FIM').asDateTime
          else
            DataFinal := Date;

          TempoExp := TempoExp +
            Round((DataFinal - CdsHstExper.FieldByName('DAT_INI').asDateTime) * 12 / 365.25);
          CdsHstExper.Next;
        end;

        if ((ListaSinalExper[c] = '>=') and (TempoExp <  MinTeor)) or
           ((ListaSinalExper[c] = '=')  and (TempoExp <> MinTeor)) or
           ((ListaSinalExper[c] = '<')  and (TempoExp >= MinTeor)) then
          exit
        else
          Accept := true;
      end;
    end;
  end;

  if (TipoSelTipoAvaliacoes <> 1) then
  begin
    if (TipoSelTipoAvaliacoes = 0) then // Padrão
    begin
      CdsAvalReqCargo.First;
      while not(CdsAvalReqCargo.EOF) do
      begin        
        Accept := false;
        if not(CdsHstAval.Locate('IDPESSOA;CODTIPOAVAL',
               VarArrayOf([CdsPrincipal.FieldByName('IDPESSOA').asFloat,
                           CdsAvalReqCargo.FieldByName('CODTIPOAVAL').asFloat]), [])) then
          exit;

        while (CdsHstAval.FieldByName('IDPESSOA').asFloat =
               CdsPrincipal.FieldByName('IDPESSOA').asFloat) and
              (CdsHstAval.FieldByName('CODTIPOAVAL').asFloat =
               CdsAvalReqCargo.FieldByName('CODTIPOAVAL').asFloat) and
              not(CdsHstAval.EOF) do
        begin
          if ((SinalTipoAvaliacoes = '>=') and
              (CdsHstAval.FieldByName('AVALIACAO').asInteger >= CdsAvalReqCargo.FieldByName('AVALIACAO').asInteger)) or
             ((SinalTipoAvaliacoes = '=') and
              (CdsHstAval.FieldByName('AVALIACAO').asInteger = CdsAvalReqCargo.FieldByName('AVALIACAO').asInteger)) or
             ((SinalTipoAvaliacoes = '<') and
              (CdsHstAval.FieldByName('AVALIACAO').asInteger < CdsAvalReqCargo.FieldByName('AVALIACAO').asInteger)) then
          begin
            Accept := true;
            break;
          end;
          CdsHstAval.Next;
        end;
        if not(Accept) then
          exit;

        CdsAvalReqCargo.Next;
      end;
    end;

    if (TipoSelTipoAvaliacoes = 2) and (ListaIdTipAval.Count > 0) then //Aval. Indicadas
    begin
      for c:=0 to (ListaIdTipAval.Count - 1) do
      begin
        Accept := false;
        CodAux := StrToFloat(ListaIdTipAval[c]);
        MinTeor := StrToInt(ListaIMinAval[c]);

        if not(CdsHstAval.Locate('IDPESSOA;CODTIPOAVAL',
               VarArrayOf([CdsPrincipal.FieldByName('IDPESSOA').asFloat, CodAux]), [])) then
          exit;

        while (CdsHstAval.FieldByName('IDPESSOA').asFloat =
               CdsPrincipal.FieldByName('IDPESSOA').asFloat) and
              (CdsHstAval.FieldByName('CODTIPOAVAL').asFloat = CodAux) and not(CdsHstAval.EOF) do
        begin
          if ((ListaSinalAval[c] = '>=') and
              (CdsHstAval.FieldByName('AVALIACAO').asInteger >= MinTeor)) or
             ((ListaSinalAval[c] = '=') and
              (CdsHstAval.FieldByName('AVALIACAO').asInteger = MinTeor)) or
             ((ListaSinalAval[c] = '<') and
              (CdsHstAval.FieldByName('AVALIACAO').asInteger < MinTeor)) then
          begin
            Accept := true;
            break;
          end;
          CdsHstAval.Next;
        end;

        if not(Accept) then
          exit;
      end;
    end;
  end;

  MinTeor := FU.StrInt(DesempenhoMin);
  if (SimulaDesempenho) and (MinTeor > 0) and not(cbxCandidatos.Checked) and
     (CodGrupo <> ' ') then
  begin
    Accept := false;
    CodAux := 0;
    DataFinal := 0;
    NumFinal := 0;
    if (CdsHstAval.Locate('IDPESSOA', CdsPrincipal.FieldByName('IDPESSOA').asFloat, [])) then
    begin
      CdsTipAval.Locate('CODTIPOAVAL', CdsHstAval.FieldByName('CODTIPOAVAL').asString, []);
    end
    else
      exit;

    while (CdsHstAval.FieldByName('IDPESSOA').asFloat =
           CdsPrincipal.FieldByName('IDPESSOA').asFloat) and not(CdsHstAval.EOF) do
    begin
      if (CdsTipAval.FieldByName('FLGTIPOAVAL').asInteger < 2) and
         (CdsHstAval.FieldByName('DATAREAL').asDateTime > DataFinal) then
      begin
        DataFinal := CdsHstAval.FieldByName('DATAREAL').asDateTime;
        NumFinal := CdsHstAval.FieldByName('NUMSEQ').asInteger;
        CodAux := CdsHstAval.FieldByName('CODTIPOAVAL').asFloat;
      end;                     
      CdsHstAval.Next;
    end;

    if not(CdsHstAval.Locate('IDPESSOA;CODTIPOAVAL;NUMSEQ',
           VarArrayOf([CdsPrincipal.FieldByName('IDPESSOA').asFloat, CodAux, NumFinal]), [])) then
      exit;

    if (DataFinal > 0) then
    begin
      CdsHstDesemp.Data := CtrlRegDesemp.ListHstDesemp(
        CdsHstAval.FieldByName('IDPESSOA').asFloat,
        CdsHstAval.FieldByName('CODTIPOAVAL').asFloat,
        CdsHstAval.FieldByName('NUMSEQ').asInteger);
      CdsHstDesemp.First;
      MinPrat := 0;
      while not(CdsHstDesemp.EOF) do
      begin
        if (CdsPesos.Locate('CODGRPFUNC;IDFATORAVAL',
            VarArrayOf([CdsHstDesemp.FieldByName('IDFATORAVAL').asFloat, CodGrupo]), [])) then
          MinPrat := MinPrat + CdsPesos.FieldByName('PESO').asInteger *
            CdsHstDesemp.FieldByName('GRAU').asInteger;
        CdsHstDesemp.Next;
      end;

      if ((SinalDesempenho = '>=') and (MinPrat >= MinTeor)) or
         ((SinalDesempenho = '=')  and (MinPrat =  MinTeor)) or
         ((SinalDesempenho = '<')  and (MinPrat <  MinTeor)) then
        Accept := true
      else
        exit;
    end;
  end;
end;

procedure TfrmSelPess.sbtnFichaClick(Sender: TObject);
var
  c: integer;
  bOk, bImprimirOBS: boolean;
  dIdCandidato: double;
begin
  if (cbxCandidatos.Checked) then
  begin
    with TfrmParamDossieCand.Create(Application) do
    begin
      CdsCandidato.Filtered := false;
      CdsCandidato.Filter := 'IDPESSOA = ' + Self.CdsPrincipal.FieldByName('IDPESSOA').asString;
      CdsCandidato.Filtered := true;
      dblckCandidato.LookupValue := Self.CdsPrincipal.FieldByName('IDPESSOA').asString;
      dblckCandidato.Update;

      bOk := (ShowModal = mrOk);
      dIdCandidato := Cmp_Padrao.ParamByName('IdCandidato').asFloat;
      bImprimirOBS := Cmp_Padrao.ParamByName('ImprimirOBS').asBoolean;
      Free;
    end;
    if (bOk) then
    begin
      RptDossieCand := TRptDossieCand.Create(Application);
      RptDossieCand.CrmRptCM.IdReports := 2982;
      RptDossieCand.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
      RptDossieCand.CrmRptCM.OrigemCM := 1;
      RptDossieCand.CrmRptCM.IdModulo := Sistema.IdModulo;
      RptDossieCand.CrmRptCM.IdUsuario := Sistema.IdUsuario;
      RptDossieCand.CmpRptCM.ParamByName('IdCandidato').asFloat := dIdCandidato;
      RptDossieCand.CmpRptCM.ParamByName('ImprimirOBS').asBoolean := bImprimirOBS;
      RptDossieCand.CrmRptCM.Print;
      FreeAndNil(RptDossieCand);
    end;
  end
  else
  begin
    with TfrmParamFichaFunc.Create(Application) do
    begin
      CdsFunc.Filtered := false;
      CdsFunc.Filter := 'IDPESSOA = ' + Self.CdsPrincipal.FieldByName('IDPESSOA').asString;
      CdsFunc.Filtered := true;
      dblckFunc.LookupValue := Self.CdsPrincipal.FieldByName('IDPESSOA').asString;
      dblckFunc.Update;
      rgSelecao.ItemIndex := 0;
      rgSelecaoClick(Sender);
      rgSelecao.Enabled := false;
      dblckFunc.Enabled := false;

      DestruirForm := false;

      bOk := (ShowModal = mrOk);
      for c:=0 to Cmp_Padrao.Params.Count-1 do
        Self.Cmp_Padrao.ParamValues[c].Value := Cmp_Padrao.ParamValues[c].Value;
      Free;
    end;
    if (bOk) then
    begin
      RptFichaFunc := TRptFichaFunc.Create(Application);
      RptFichaFunc.CrmRptCM.IdReports := 567;
      RptFichaFunc.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
      RptFichaFunc.CrmRptCM.OrigemCM := 1;
      RptFichaFunc.CrmRptCM.IdModulo := Sistema.IdModulo;
      RptFichaFunc.CrmRptCM.IdUsuario := Sistema.IdUsuario;
      for c:=0 to Self.Cmp_Padrao.Params.Count-1 do
        RptFichaFunc.CmpRptCM.ParamValues[c].Value := Self.Cmp_Padrao.ParamValues[c].Value;
      RptFichaFunc.CrmRptCM.Print;
      FreeAndNil(RptFichaFunc);
    end;
  end;
end;

procedure TfrmSelPess.sbtnListaClick(Sender: TObject);
var
  Marca: TBookmark;
begin
  frmAguarde.Mostra('Listagem das Pessoas Selecionadas');
  RptPotencCandReq := TRptPotencCandReq.Create(Application);
  RptPotencCandReq.bCandidato := cbxCandidatos.Checked;
  Marca := CdsPrincipal.GetBookmark;
  CdsPrincipal.DisableControls;

  CdsPrincipal.First;
  while not(CdsPrincipal.EOF) do
  begin
    if (RptPotencCandReq.ListaIdPessoa = '') then
      RptPotencCandReq.ListaIdPessoa := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      RptPotencCandReq.ListaIdPessoa := RptPotencCandReq.ListaIdPessoa +','+
        CdsPrincipal.FieldByName('IDPESSOA').asString;
    CdsPrincipal.Next;
  end;

  CdsPrincipal.GotoBookmark(Marca);
  CdsPrincipal.EnableControls;
  CdsPrincipal.FreeBookmark(Marca);

  RptPotencCandReq.CrmRptCM.IdReports := 3839;
  RptPotencCandReq.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
  RptPotencCandReq.CrmRptCM.OrigemCM := 1;
  RptPotencCandReq.CrmRptCM.IdModulo := Sistema.IdModulo;
  RptPotencCandReq.CrmRptCM.IdUsuario := Sistema.IdUsuario;
  RptPotencCandReq.CrmRptCM.Print;
  FreeAndNil(RptPotencCandReq);
end;

procedure TfrmSelPess.sbtnAssocClick(Sender: TObject);
var
  bOk: boolean;
  CdsAux: TCMClientDataSet;
begin
  CdsAux := TCMClientDataSet.Create(nil);
  CtrlReqPessoal.CdsReqCandidato := CdsAux;
  CdsAux.Data := CtrlReqPessoal.ListReqCand(-1, -1);
  CdsPrincipal.First;
  while not(CdsPrincipal.EOF) do
  begin
    CdsAux.Insert;
    CdsAux.FieldByName('NUMREQ').asFloat := NumReq;
    CdsAux.FieldByName('IDPESSOA').asFloat := CdsPrincipal.FieldByName('IDPESSOA').asFloat;
    CdsAux.Post;
    CdsPrincipal.Next;
  end;

  bOk := CtrlReqPessoal.InserirRequisicaoCand;

  CdsAux.Free;
  if (bOk) then
    MsgDlg(CtrlReqPessoal.MessageInfo, 'Aviso', mtInformation, [mbOk,mbHelp], 0)
  else
    raise Exception.Create(CtrlReqPessoal.MessageInfo);
end;

procedure TfrmSelPess.bbtnConfirmarClick(Sender: TObject);
begin
  AbrirQueryPrincipal := false;
  inherited;
  sqlPrincipal.Open;

  sbtnFicha.Visible := not(CdsPrincipal.IsEmpty);
  sbtnLista.Visible := not(CdsPrincipal.IsEmpty);
  sbtnAssoc.Visible := not(CdsPrincipal.IsEmpty) and (SelReqPessoal) and not(CandAssociados);
  Toolbar971.Visible := (sbtnFicha.Visible) or  (sbtnLista.Visible) or (sbtnAssoc.Visible);
  ModalResult := mrNone;
end;

procedure TfrmSelPess.SelDetalhes;
var
  IdCargo: double;
begin
  if (CdsPrincipal.FieldByName('IDCARGO').asFloat = 0) then
    IdCargo := -1
  else
    IdCargo := CdsPrincipal.FieldByName('IDCARGO').asFloat;

  CdsCargo2.Filter := 'IDCARGO = ' + FloatToStr(IdCargo);
  CdsCursoReq.Filter := 'IDCARGO = ' + FloatToStr(IdCargo);
  CdsExperReqCargo.Filter := 'IDCARGO = ' + FloatToStr(IdCargo);
  CdsAvalReqCargo.Filter := 'IDCARGO = ' + FloatToStr(IdCargo);
end;

procedure TfrmSelPess.IniciarDados;
begin
  CdsHstTrn.Data := CtrlRegTrein.ListHistorico_Treinamento;
  CdsHstTrn.AddIndex('CdsHstTrnIndex', 'IDPESSOA;IDCURSO;DATREINI', []);
  CdsHstTrn.IndexName := 'CdsHstTrnIndex';

  CdsHstExper.Data := CtrlRegExp.ListHistorico;
  CdsHstExper.AddIndex('CdsHstExperIndex', 'IDPESSOA;IDEXPER;DAT_INI', []);
  CdsHstExper.IndexName := 'CdsHstExperIndex';

  CdsHstAval.Data := CtrlRegAval.ListHstAval;
  CdsHstAval.AddIndex('CdsHstAvalIndex', 'IDPESSOA;CODTIPOAVAL;NUMSEQ', []);
  CdsHstAval.IndexName := 'CdsHstAvalIndex';

  CdsHstDesemp.Data := CtrlRegDesemp.ListHstDesemp;
  CdsHstDesemp.AddIndex('CdsHstDesempIndex', 'IDPESSOA;CODTIPOAVAL;NUMSEQ', []);
  CdsHstDesemp.IndexName := 'CdsHstDesempIndex';

  CdsPesos.Data := CtrlPesoFatGrp.ListPeso;
  CdsPesos.AddIndex('CdsPesosIndex', 'CODGRPFUNC;IDFATORAVAL', []);
  CdsPesos.IndexName := 'CdsPesosIndex';

  CdsCurso.Data := CtrlCurso.ListGeral;
  CdsTipAval.Data := CtrlTipAval.ListTipoAval;

  CdsCargo2.Data := CtrlCargo.ListCargo;
  CdsCargo2.Filtered := true;

  CdsCursoReq.Data := CtrlCursoReq.ListCursoReq;
  CdsCursoReq.Filtered := true;

  CdsExperReqCargo.Data := CtrlExpReq.ListExperReqCargo;
  CdsExperReqCargo.Filtered := true;

  CdsAvalReqCargo.Data := CtrlAvalReq.ListAvalCargo;
  CdsAvalReqCargo.Filtered := true;

  CdsPrincipal.Filter := '';
  CdsPrincipal.Filtered := true;
end;

end.
