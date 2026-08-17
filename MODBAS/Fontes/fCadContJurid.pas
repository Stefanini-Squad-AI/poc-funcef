unit fCadContJurid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MontaSelect,
  DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook, CMTree, Mask, DBCtrls,
  wwdbedit, IvDictio, IvMulti, IvEMulti, CMProcuraMask, CmEventosCadastro, ImgList,
  FCadMestreDetCS, Wwquery, Wwtable;

type
  TfrmCadContJurid = class(TfrmCadMestreDetalheCS)
    dbedDescricao: TwwDBEdit;
    Label2: TLabel;
    qryContabJurid: TwwQuery;
    updContabJurid: TUpdateSQL;
    qryPlano: TwwQuery;
    qryParam: TwwQuery;
    qryParamPLANO: TFloatField;
    CMProcuraMaskContabilCredito: TCMProcuraMaskContabil;
    CMProcuraMaskContabilDebito: TCMProcuraMaskContabil;
    dbrgIndPrincipal: TDBRadioGroup;
    dbrgMateria: TDBRadioGroup;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryContabJuridAfterInsert(DataSet: TDataSet);
    procedure qryContabJuridBeforePost(DataSet: TDataSet);
  private
    sMascaraPlano: string;
  end;

var
  frmCadContJurid: TfrmCadContJurid;

implementation

uses uMensErro, uDataBase, uSistema, uModulo, uFuncoesUteis;

{$R *.DFM}

procedure TfrmCadContJurid.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('CODTIPOOBJETO').asInteger := 0;
  qry.Open;

  qryContabJurid.Close;
  qryContabJurid.ParamByName('CODTIPOOBJETO').asInteger := 0;
  qryContabJurid.Open;

  qryParam.SQL.Clear;
  qryParam.SQL.Text := 'SELECT PLANO FROM PARAMCONTAB WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);
  qryParam.Open;

  qryPlano.SQL.Clear;
  qryPlano.SQL.Text := 'SELECT MASCARA FROM PLANO WHERE PLANO = ' + IntToStr(qryParam.FieldByName('Plano').asInteger);
  qryPlano.Open;

  sMascaraPlano := qryPlano.FieldByName('MASCARA').asString;
  CMProcuraMaskContabilDebito.Mascara  := sMascaraPlano;
  CMProcuraMaskContabilCredito.Mascara := sMascaraPlano;
  CMProcuraMaskContabilDebito.Plano    := qryParam.FieldByName('Plano').asInteger;
  CMProcuraMaskContabilCredito.Plano   := qryParam.FieldByName('Plano').asInteger;

  case (Sistema.IdModulo) of
    MODCON            : HelpContext := 760017;
    PROCJUD, PROCPREV : HelpContext := 1100011;
  end;
end;

procedure TfrmCadContJurid.qryContabJuridAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryContabJurid.FieldByName('IdContabJurid').asInteger := LeUltRegistro(nil,'CONTABJURID');
  qryContabJurid.FieldByName('CODTIPOOBJETO').Value :=
    qry.FieldByName('CODTIPOOBJETO').Value;
end;

procedure TfrmCadContJurid.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
    qry.Close;
    qry.ParamByName('CODTIPOOBJETO').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;

    qryContabJurid.Close;
    qryContabJurid.ParamByName('CODTIPOOBJETO').asInteger := StrToInt(MontaSelect.ValoresChave[0]);
    qryContabJurid.Open;
  end;
end;

procedure TfrmCadContJurid.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  try
    AplicaAlteracoes([qryContabJurid]);
  except
    raise;
  end;
end;

procedure TfrmCadContJurid.qryContabJuridBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (CMProcuraMaskContabilDebito.Conta <> nil) then
    qryContabJurid.FieldByName('IdPlano2').asInteger := qryParam.FieldByName('Plano').asInteger;
  if (CMProcuraMaskContabilCredito.Conta <> nil) then
    qryContabJurid.FieldByName('IdPlano1').asInteger := qryParam.FieldByName('Plano').asInteger;
end;

end.
