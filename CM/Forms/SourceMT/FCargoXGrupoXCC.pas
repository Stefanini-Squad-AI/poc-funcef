unit FCargoXGrupoXCC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCmSqlParams, wwdblook, CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid, FOkCancelar,
  uCtrlCargoXGrupoXCC;

type
  TFrmCargoXGrupoXCC = class(TFrmOkCancelar)
    SQL: TCMSqlParams;                                                                
    SQLFuncao: TCMSqlParams;
    CdsFuncao: TCMClientDataSet;
    SQLCargo: TCMSqlParams;
    CdsCargo: TCMClientDataSet;
    SQLCentroCusto: TCMSqlParams;
    CdsCentroCusto: TCMClientDataSet;
    CmbCentCusto: TCMDBLookupCombo;
    CmbCargo: TCMDBLookupCombo;
    CmbFuncao: TCMDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GrdGrupos: TwwDBGrid;
    Cds: TCMClientDataSet;
    Ds: TwwDataSource;
    ImlGrupos: TImageList;
    CdsProcessa: TCMClientDataSet;
    SQLProcessa: TCMSqlParams;
    procedure SQLFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure FormCreate(Sender: TObject);
    procedure CdsBeforePost(DataSet: TDataSet);
    procedure CmbCentCustoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CargoXGrupoXCC: TCtrlCargoXGrupoXCC;
    procedure SelGrupos;
  public
    { Public declarations }
  end;

var
  FrmCargoXGrupoXCC: TFrmCargoXGrupoXCC;

implementation

Uses uSistema, uMensErro, uCtrlPadroes;

{$R *.DFM}

procedure TFrmCargoXGrupoXCC.SQLFormartParam(sParamName, sOldValue: String;
  var sNewValue: String);
begin
  inherited;
  if sParamName = 'IDFUNCAO' then
  begin
     if CmbFuncao.Text = '' then
        sNewValue := 'IS NULL'
     else
        sNewValue := '= ' + sOldValue;
  end;
end;

procedure TFrmCargoXGrupoXCC.FormCreate(Sender: TObject);
begin
  inherited;
  CargoXGrupoXCC := TCtrlCargoXGrupoXCC.Create;
  CargoXGrupoXCC.InitializeAs(Padroes);

  SelGrupos;

  SQLCentroCusto.Prepare;
  SQLCentroCusto.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
  SQLCentroCusto.Open;

  SQLCargo.Open;
  SQLFuncao.Open;
end;

procedure TFrmCargoXGrupoXCC.CdsBeforePost(DataSet: TDataSet);
begin
  inherited;
  Cds.FieldByName('IMAGEINDEX').AsInteger := Cds.FieldByName('SELECIONADO').AsInteger;
end;

procedure TFrmCargoXGrupoXCC.SelGrupos;
begin
  SQL.Prepare;
  SQL.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
  SQL.ParamByName('CODCENTROCUSTO').AsInteger := StrToIntDef(CmbCentCusto.LookupValue, -1);
  SQL.ParamByName('IDCARGO').AsInteger := StrToIntDef(CmbCargo.LookupValue, -1);
  SQL.ParamByName('IDFUNCAO').AsInteger := StrToIntDef(CmbFuncao.LookupValue, -1);
  SQL.Open;
end;

procedure TFrmCargoXGrupoXCC.CmbCentCustoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then SelGrupos;
end;

procedure TFrmCargoXGrupoXCC.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if (Cds.Active) And
     (Cds.ChangeCount > 0) Then
  begin
     if CmbCentCusto.Text = '' Then
        MsgDlg('Obrigatório a indicação do Centro de Custo.','Atenção',mtError,[MbOk],0)
     Else
       if CmbCargo.Text = '' Then
          MsgDlg('Obrigatório a indicação do Cargo.','Atenção',mtError,[MbOk],0)
       Else
       begin
          SQLProcessa.Prepare;
          SQLProcessa.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
          SQLProcessa.ParamByName('CODCENTROCUSTO').AsString := CmbCentCusto.LookupValue;
          SQLProcessa.ParamByName('IDCARGO').AsInteger := StrToIntDef(CmbCargo.LookupValue, 0);
          SQLProcessa.ParamByName('IDFUNCAO').AsInteger := StrToIntDef(CmbFuncao.LookupValue, 0);
          SQLProcessa.Open;

          While Not CdsProcessa.Eof do
             CdsProcessa.Delete;

          Cds.First;
          Cds.DisableControls;
          While Not Cds.Eof do
          begin
             If Cds.FieldByName('SELECIONADO').AsInteger = 1 then
             begin
               CdsProcessa.Append;
               CdsProcessa.FieldByName('IDCARGO').AsInteger := StrToIntDef(CmbCargo.LookupValue, 0);
               CdsProcessa.FieldByName('IDFUNCAO').AsInteger := StrToIntDef(CmbFuncao.LookupValue, 0);
               CdsProcessa.FieldByName('CODCENTROCUSTO').AsString := CmbCentCusto.LookupValue;
               CdsProcessa.FieldByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
               CdsProcessa.FieldByName('IDESPACESSO').AsFloat := Cds.FieldByName('IDESPACESSO').AsFloat;
               CdsProcessa.Post;
             End;

             Cds.Next;
          end;
          Cds.First;
          Cds.EnableControls;

          if not CargoXGrupoXCC.ProcessaCds(CdsProcessa.Data) then
             MsgDlg(CargoXGrupoXCC.MessageInfo, 'Atenção', mtError, [mbOk], 0)
          Else
          Begin
             SQL.Prepare;
             SQL.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
             SQL.ParamByName('CODCENTROCUSTO').AsInteger := StrToIntDef(CmbCentCusto.LookupValue, -1);
             SQL.ParamByName('IDCARGO').AsInteger := StrToIntDef(CmbCargo.LookupValue, -1);
             SQL.ParamByName('IDFUNCAO').AsInteger := StrToIntDef(CmbFuncao.LookupValue, -1);
             SQL.Open;
          end;
       end;
  end;
end;

procedure TFrmCargoXGrupoXCC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CargoXGrupoXCC.Free;
end;

end.
