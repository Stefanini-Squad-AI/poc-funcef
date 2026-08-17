unit fCadCtFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fCadMestreDetCS,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls,
  Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook,
  CMTree, Mask, DBCtrls, wwdbedit, Wwtable, IvDictio, IvMulti, IvEMulti, CMProcuraMask,
  CmEventosCadastro, ImgList, CMProcuraSubTipo;

type
  TfrmCadCtFolha = class(TfrmCadMestreDetalheCS)
    dbedDescricao: TwwDBEdit;
    Label2: TLabel;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryPlano: TwwQuery;
    qryParam: TwwQuery;
    qryParamPLANO: TFloatField;
    dbrgrpDesconto: TDBRadioGroup;
    dsSubContaD: TwwDataSource;
    qrySubContaD: TwwQuery;
    qrySubConta: TwwQuery;
    dsSubConta: TwwDataSource;
    qryCCusto: TwwQuery;
    qryTipoDesemb: TwwQuery;
    qryTipoDesembDESCRICAO: TStringField;
    qryTipoDesembANASINT: TStringField;
    qryTipoDesembCODTIPRECDES: TStringField;
    qryTipoDesembRECPAG: TStringField;
    qryTipoDesembIDPESSOA: TFloatField;
    msTipoDesemb: TMontaSelect;
    qryCentRespon: TwwQuery;
    qryCentResponNOME: TStringField;
    qryCentResponANALITICOSINTET: TStringField;
    qryCentResponCODCENTRORESPON: TStringField;
    qryCentResponIDPESSOA: TFloatField;
    msCentRespon: TMontaSelect;
    qryABC: TwwQuery;
    qryABCNOME: TStringField;
    qryABCUNIDNEGOC: TFloatField;
    qryABCUNECODIGO: TStringField;
    qryABCIDPESSOA: TFloatField;
    qryABCUNETIPO: TStringField;
    msABC: TMontaSelect;
    qryParamGlobal: TwwQuery;
    pgParams: TPageControl;
    tbshContab: TTabSheet;
    CMProcuraMaskContabilDebito: TCMProcuraMaskContabil;
    CMProcuraMaskContabilCredito: TCMProcuraMaskContabil;
    cmbSubContaD: TwwDBLookupCombo;
    Label4: TLabel;
    cmbSubContaC: TwwDBLookupCombo;
    Label1: TLabel;
    cmbCCusto: TwwDBLookupCombo;
    Label6: TLabel;
    tbshCAP: TTabSheet;
    CmProcTipDesemb: TCMProcuraMask;
    ProcuraFavorecido: TCMProcuraForCli;
    CmpCentRespon: TCMProcuraMask;
    CmpABC: TCMProcuraMask;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure qryDetBeforePost(DataSet: TDataSet);
  private
    sMascaraPlano: string;
  end;

var
  frmCadCtFolha: TfrmCadCtFolha;

implementation

uses uDataBase, uSistema, uFuncoesUteis;

{$R *.DFM}

procedure TfrmCadCtFolha.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('(RUBRICAXPESS.IDRUBRICA IS NULL OR RUBRICAXPESS.IDPESSOA = '+
    IntToStr(Sistema.IdEmpresa) + ')');

  qry.Close;
  qry.ParamByName('IDPROVENTO').asInteger := 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IDPROVENTO').asInteger := 0;
  qryDet.Open;          

  qryParam.SQL.Clear;
  qryParam.SQL.Text := 'SELECT PLANO FROM PARAMCONTAB WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);
  qryParam.Open;

  qryPlano.SQL.Clear;
  qryPlano.SQL.Add('SELECT MASCARA FROM PLANO WHERE PLANO = ' + IntToStr(qryParam.FieldByName('Plano').asInteger));
  qryPlano.Open;
  sMascaraPlano := qryPlano.FieldByName('MASCARA').asString;
  CMProcuraMaskContabilDebito.Mascara  := sMascaraPlano;
  CMProcuraMaskContabilCredito.Mascara := sMascaraPlano;
  CMProcuraMaskContabilDebito.Plano    := qryParam.FieldByName('PLANO').asInteger;
  CMProcuraMaskContabilCredito.Plano   := qryParam.FieldByName('PLANO').asInteger;

  qryCCusto.SQL.Clear;
  qryCCusto.SQL.Add('SELECT CODCENTROCUSTO,NOME FROM CENTCUST');
  qryCCusto.SQL.Add('WHERE  IDEMPRESA = '+ InttoStr(Sistema.idEmpresa));
  qryCCusto.SQL.Add('ORDER BY UPPER(NOME)');
  qryCCusto.Open;

  qrySubConta.Open;
  qrySubContaD.Open;

  qryParamGlobal.ParamByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
  qryParamGlobal.Open;

  MsCentRespon.Filtro.Add('CENTRESPON.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
  MsABC.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
  MsTipoDesemb.Filtro.Add('TIPORECEBDESEMB.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
  MsTipoDesemb.Filtro.Add('TIPORECEBDESEMB.RECPAG = ''P''');

  CmProcTipDesemb.Mascara := '';
  qryTipoDesemb.ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
  qryTipoDesemb.ParamByName('RECPAG').asString    :=  'P';

  CmpCentRespon.Mascara := qryParamGlobal.FieldByName('MASCCENTRORESPON').asString + ';0;';
  qryCentRespon.ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;

//  CmpABC.Mascara := qryParamGlobal.FieldByName('MASCUNIDNEGOC').AsString + ';0;';
  qryABC.ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;

  CmpCentRespon.Visible := (qryParamGlobal.FieldByName('USACRESPON').asString = 'S');
  CmpABC.Visible        := (qryParamGlobal.FieldByName('USAABC').asString     = 'S');

  qryParamGlobal.Close;
end;

procedure TfrmCadCtFolha.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
    qry.Close;
    qry.ParamByName('IDPROVENTO').asInteger := StrInt(MontaSelect.ValoresChave[0]);
    qry.Open;

    qryDet.Close;
    qryDet.ParamByName('IDPROVENTO').asInteger := StrInt(MontaSelect.ValoresChave[0]);
    qryDet.Open;
  end;
end;

procedure TfrmCadCtFolha.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryDet.FieldByName('IdContabFolha').asInteger := LeUltRegistro(nil,'CONTABFOLHA');
  qryDet.FieldByName('IDPROVENTO').asInteger    := qry.FieldByName('IDPROVENTO').asInteger;
end;

procedure TfrmCadCtFolha.qryDetBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (CMProcuraMaskContabilDebito.Conta <> nil) then
    qryDet.FieldByName('IdPlano2').asInteger := qryParam.FieldByName('Plano').asInteger;
  if (CMProcuraMaskContabilCredito.Conta <> nil) then
    qryDet.FieldByName('IdPlano1').asInteger := qryParam.FieldByName('Plano').asInteger;
end;

procedure TfrmCadCtFolha.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  try
    AplicaAlteracoes([qryDet]);
  except
    raise;
  end;
end;

end.
