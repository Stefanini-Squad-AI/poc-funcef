unit FCadUnidCentr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetImob, StdCtrls, Mask, DBCtrls, Db, CmEventosCadastro,
  ImgList, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti, Wwdatsrc,
  Wwquery, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, wwdblook;

type
  TfrmCadUnidCentr = class(TfrmCadastroMestreDetImob)
    MS_Pessoa: TMontaSelect;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    qryIDUNIDCENTR: TFloatField;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    qryNOME: TStringField;
    qryPERCENTUAL: TFloatField;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    qryDetIDUNIDCENTR: TFloatField;
    qryDetNOME: TStringField;
    qryDetCODESTADO: TStringField;
    qryDetNOMEESTADO: TStringField;
    qryEstado: TwwQuery;
    qryEstadoCODESTADO: TStringField;
    qryEstadoNOMEESTADO: TStringField;
    dsEstado: TwwDataSource;
    dblEstado: TwwDBLookupCombo;
    wwDBGrid1: TwwDBGrid;
    qryDetIDPAIS: TFloatField;
    qryEstadoIDPAIS: TFloatField;
    ToolbarButton971: TToolbarButton97;
    ToolbarButton972: TToolbarButton97;
    btnTodasUF: TBitBtn;
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dblEstadoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnTodasUFClick(Sender: TObject);
  private
    { Private declarations }
    iIdPessoa : Int64;
    sNome     : String;

  public
    { Public declarations }
  end;

var
  frmCadUnidCentr: TfrmCadUnidCentr;

implementation

uses UFuncoesEmptmo, uSistema;

{$R *.DFM}



procedure TfrmCadUnidCentr.btnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   MS_Pessoa.Executar;
   if MS_Pessoa.RetornouValor then begin
      iIdPessoa := StrToInt(MS_Pessoa.ValoresChave[0]);
      sNome     := MS_Pessoa.ValoresChave[1];
      
      if not qry.Active then qry.Active;

      LimpaParametros(qryDet);
      qryDet.ParamByName('PIDUNIDCENTR').AsInteger := iIdPessoa;
      qryDet.Open;
   end;
end;



procedure TfrmCadUnidCentr.sbtnInserirClick(Sender: TObject);
begin
   if qry.State = dsInactive then qry.Open;
   inherited;
   btnBuscaContratoClick(Self);
   qryIDUNIDCENTR.AsInteger := iIDPessoa;
   qryNOME.AsString         := sNome;
   qryPERCENTUAL.AsFloat    := 100;
end;



procedure TfrmCadUnidCentr.FormShow(Sender: TObject);
begin
   inherited;
   qryEstado.ParamByName('PIDPAIS').AsInteger := 1;
   qryEstado.Open;
   LimpaParametros(qry);
   qry.ParamByName('PIDUNIDCENTR').AsInteger := -1;
   qry.Open;
end;



procedure TfrmCadUnidCentr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   qry.Close;
   qryDet.Close;
   qryEstado.Close;
   inherited;
end;



procedure TfrmCadUnidCentr.CmeCadastroFind(Sender: TObject);
begin
   inherited;
   if MontaSelect.RetornouValor then begin
      LimpaParametros(qry);
      qry.ParamByName('PIDUNIDCENTR').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
      qry.Open;
      LimpaParametros(qryDet);
      qryDet.ParamByName('PIDUNIDCENTR').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);
      qryDet.Open;
   end;
end;



procedure TfrmCadUnidCentr.sbtnInsDetClick(Sender: TObject);
begin
   inherited;
   if qryDet.State <> dsInsert then qryDet.Insert;
   qryDetIDUNIDCENTR.AsInteger := qryIDUNIDCENTR.AsInteger;
   btnTodasUF.Enabled          := True;
end;



procedure TfrmCadUnidCentr.bbtnOkDetClick(Sender: TObject);
begin
//   inherited;
   if qryDet.State in dsEditModes then begin
      if not qryDetIDUNIDCENTR.IsNull then begin
         qryDetNOMEESTADO.AsString := qryEstadoNOMEESTADO.AsString;
         qryDet.Post;

         if qry.State = dsEdit then begin
            qryDet.ApplyUpdates;
            qryDet.Close;
            qryDet.Open;
         end;

         btnTodasUF.Enabled := False;
         bbtnCancelarDetClick(Self);
      end;
   end;
end;



procedure TfrmCadUnidCentr.sbtnExcluiDetClick(Sender: TObject);
begin
//   inherited;
   qryDet.Delete;
   qryDet.ApplyUpdates;
end;



procedure TfrmCadUnidCentr.dblEstadoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   qryDetNOME.AsString    := qryEstadoNOMEESTADO.AsString;
   qryDetIDPAIS.AsInteger := qryEstadoIDPAIS.AsInteger;
   Repaint;
end;



procedure TfrmCadUnidCentr.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if qryDet.UpdatesPending then qryDet.ApplyUpdates;
   LimpaParametros(qry);
   qryDet.Close;
end;



procedure TfrmCadUnidCentr.btnTodasUFClick(Sender: TObject);
begin
  inherited;
   qryDet.DisableControls;
   qryEstado.First;
   while not qryEstado.Eof do begin
      sbtnInsDetClick(Self);
      qryDetCODESTADO.AsString := qryEstadoCODESTADO.AsString;
      bbtnOkDetClick(Self);
      qryEstado.Next;
   end;
   qryDet.EnableControls;
end;



end.
