unit FCadRegDesemp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  Mask, DBCtrls, Wwtable, wwdbdatetimepicker, CMDateTimePicker, wwdblook,
  CmEventosCadastro, ImgList;

type
  TfrmCadRegDesemp = class(TfrmCadMestreDetalheCS)
    Label1: TLabel;
    dbedMatricula: TDBEdit;
    Label10: TLabel;
    dbedNome: TDBEdit;
    qryTipoAval: TwwQuery;
    tbshFortes: TTabSheet;
    tbshMetas: TTabSheet;
    tbshResumo: TTabSheet;
    tbshGerais: TTabSheet;
    Label8: TLabel;
    dbedAvaliador: TDBEdit;
    Label2: TLabel;
    dblcTipoEntr: TwwDBLookupCombo;
    Label3: TLabel;
    dbedDatPlan: TCMDateTimePicker;
    Label4: TLabel;
    dbedDatReal: TCMDateTimePicker;
    Label5: TLabel;
    dbedAvaliacao: TDBEdit;
    Label9: TLabel;
    dbmemFortes: TDBMemo;
    Label11: TLabel;
    dbmemFracos: TDBMemo;
    Label12: TLabel;
    dbmemLimites: TDBMemo;
    Label16: TLabel;
    dbmemMetas: TDBMemo;
    Label17: TLabel;
    dbmemMedidas: TDBMemo;
    Label13: TLabel;
    dbmemResumo: TDBMemo;
    Label15: TLabel;
    dbmemObs1: TDBMemo;
    Label14: TLabel;
    dbmemObs2: TDBMemo;
    Label6: TLabel;
    dblcFator: TwwDBLookupCombo;
    Label7: TLabel;
    dbedGrau: TDBEdit;
    Label18: TLabel;
    dbedPeso: TDBEdit;
    Label19: TLabel;
    dbedNota: TDBEdit;
    qryFator: TwwQuery;
    MontaSelectFunc: TMontaSelect;
    qryAuxNum: TwwQuery;
    tblAval: TwwTable;
    tblRelav: TwwTable;
    tblHstava: TwwTable;
    tblHstavaDESCRICAO: TStringField;
    tblHstavaGRAU: TFloatField;
    tblHstavaPESO: TIntegerField;
    tblHstavaNOTA: TIntegerField;
    tblHstavaCODTIPOAVAL: TFloatField;
    tblHstavaIDFATORAVAL: TFloatField;
    tblHstavaIDPESSOA: TFloatField;
    tblHstavaNUMSEQ: TFloatField;
    qryAux: TwwQuery;
    bbtnBuscaEmpregado: TBitBtn;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    procedure qryAfterInsert(DataSet: TDataSet);
    procedure dblcTipoEntrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcTipoEntrDropDown(Sender: TObject);
    procedure dblcFatorDropDown(Sender: TObject);
    procedure tblHstavaCalcFields(DataSet: TDataSet);
    procedure dbedGrauChange(Sender: TObject);
    procedure dblcFatorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure tblHstavaAfterInsert(DataSet: TDataSet);
    procedure bbtnBuscaEmpregadoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadRegDesemp: TfrmCadRegDesemp;
  ProxSeq, IdFator : Integer;
  CODGRP  : String;

implementation

uses USistema, UMensErro, UDataBase, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadRegDesemp.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '')  then
  begin
     tblHstava.Close;
     qry.Close;
     qry.ParamByName('IdPessoa').AsInteger    := StrToInt(MontaSelect.ValoresChave[0]);
     qry.ParamByName('CodTipoAval').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
     qry.ParamByName('NumSeq').AsInteger      := StrToInt(MontaSelect.ValoresChave[2]);
     qry.Open;
     ProxSeq := StrToInt(MontaSelect.ValoresChave[2]);
     CODGRP := qry.FieldByName('CODGRPFUNC').AsString;
     tblHstava.Open;
  end;
end;

procedure TfrmCadRegDesemp.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
// A ver
end;

procedure TfrmCadRegDesemp.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
// A ver
end;

procedure TfrmCadRegDesemp.CmeCadastroConfirma(Sender: TObject);
begin
   inherited;
   try
      AplicaAlteracoes([tblHstava]);
   except
      raise;
   end;
   
end; // CmeCadastro.Confirma(Self)

procedure TfrmCadRegDesemp.CmeDetalheConfirma(Sender: TObject);
begin
   inherited;

end; // CmeDetalhe.Confirma(Self)


procedure TfrmCadRegDesemp.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  MontaSelectFunc.Executar;
  //sbtnProcurar.down := false;
  if (MontaSelectFunc.ValoresChave.Count > 0) and
     (MontaSelectFunc.ValoresChave[0] <> '')
  then begin
//    qry.ParamByName('IdPessoa').AsInteger := StrToInt(MontaSelectFunc.ValoresChave[6]);
    qryAux.Close;
    qryAux.ParamByName('IdPessoa').AsInteger := StrToInt(MontaSelectFunc.ValoresChave[6]);
    qryAux.Open;
    qry.FieldByName('IdPessoa').AsInteger := StrToInt(MontaSelectFunc.ValoresChave[6]);
    qry.FieldByName('Avaliador').asString := Sistema.NomeUsuario;
    CODGRP := qryAux.FieldByName('CODGRPFUNC').AsString;
    qryAux.Close;
    dbedMatricula.Text := MontaSelectFunc.ValoresChave[1];
    dbedNome.Text      := MontaSelectFunc.ValoresChave[0];
  end;
end;

procedure TfrmCadRegDesemp.dblcTipoEntrCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if ds.State = dsInsert  then begin
     qryAuxNum.Close;
     qryAuxNum.ParamByName('IdPessoa').AsInteger  := StrToInt(MontaSelectFunc.ValoresChave[6]);
     qryAuxNum.ParamByName('CodTipoAval').AsInteger  := qryTipoAval.FieldByName('CodTipoAval').AsInteger;
     qryAuxNum.Open;
     ProxSeq := qryAuxNum.FieldByName('NumSeq').AsInteger + 1;
     qry.FieldByName('NumSeq').AsInteger := ProxSeq;
     qryAuxNum.Close;
  end;

end;

procedure TfrmCadRegDesemp.bbtnConfirmarClick(Sender: TObject);
var TotAval : Integer;
begin
  TotAval := 0;
  tblHstava.First;
  while not tblHstava.Eof do begin
     TotAval := TotAval + tblHstava.FieldByName('Nota').AsInteger;
     tblHstava.Next;
  end;
  tblHstava.First;
  qry.FieldByName('Avaliacao').AsInteger := TotAval;

  inherited;

end;

procedure TfrmCadRegDesemp.FormActivate(Sender: TObject);
begin
  inherited;
  qryTipoAval.Open;
  qryFator.Open;

  qry.Close;
  qry.ParamByName('IdPessoa').AsInteger  := 0;
  qry.ParamByName('CodTipoAval').AsInteger := 0;
  qry.ParamByName('NumSeq').AsInteger := 0;
  qry.Open;

  tblAval.Open;
  tblRelav.Open;
  tblHstAva.Open;



end;

procedure TfrmCadRegDesemp.dblcTipoEntrDropDown(Sender: TObject);
begin
  inherited;
  if not qryTipoAval.Active then qryTipoAval.Open;
end;

procedure TfrmCadRegDesemp.dblcFatorDropDown(Sender: TObject);
begin
  inherited;
  if not qryFator.Active then qryFator.Open;
end;

procedure TfrmCadRegDesemp.tblHstavaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if (dsDet.State = dsInsert) and (dblcFator.Text = '') then exit;
  if (dsDet.State <> dsInsert) then
     IdFator := tblHstava.FieldByName('IDFATORAVAL').AsInteger;
  if  tblRelav.Findkey([CODGRP, IDFATOR]) then
      tblHstavaPESO.Value := tblRelav.FieldByName('PESO').Value  else
      tblHstavaPESO.Value := 0;
  tblHstavaNOTA.Value := round(tblHstavaPESO.Value * tblHstavaGRAU.Value);
end;

procedure TfrmCadRegDesemp.dbedGrauChange(Sender: TObject);
begin
  inherited;
  if (dsDet.State = dsInsert) or  (dsDet.State = dsEdit) then
     tblHstavaCalcFields(dsDet.DataSet);
end;

procedure TfrmCadRegDesemp.dblcFatorCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  IdFator := qryFator.FieldByName('IDFATORAVAL').AsInteger;
end;

procedure TfrmCadRegDesemp.FormCreate(Sender: TObject);
begin
  inherited;
  if sUsuXccusto <> '' then begin
     MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto);
     MontaSelectFunc.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto);
  end;

  if sUsuXfilial <> '' then begin
     MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + sUsuXfilial);
     MontaSelectFunc.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + sUsuXfilial);
  end;

end;

procedure TfrmCadRegDesemp.tblHstavaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  tblHstava.FieldByName('IdPessoa').AsInteger     := qry.FieldByName('IdPessoa').AsInteger;
  tblHstava.FieldByName('CodTipoAval').AsInteger  := qry.FieldByName('CodTipoAval').AsInteger;
  tblHstava.FieldByName('NumSeq').AsInteger       := ProxSeq;
end;

procedure TfrmCadRegDesemp.bbtnBuscaEmpregadoClick(Sender: TObject);
begin
  inherited;
  if qry.State in [dsInsert, dsEdit] then
  begin
    MontaSelectFunc.Executar;
    if (MontaSelectFunc.ValoresChave.Count > 0) and (MontaSelectFunc.ValoresChave[6] <> '') then
       dbedAvaliador.Text := MontaSelectFunc.ValoresChave[0];
  end;
end;

end.
