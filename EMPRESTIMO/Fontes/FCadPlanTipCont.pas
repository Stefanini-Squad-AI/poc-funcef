unit FCadPlanTipCont;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetImob, CmEventosCadastro, ImgList, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Db, Wwdatsrc, Wwquery, MAHlpBtn,
  TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls, wwdblook;

type
  TfrmCadPlanTipCont = class(TfrmCadastroMestreDetImob)
    wwDBGrid1: TwwDBGrid;
    updDet: TUpdateSQL;
    qryDet: TwwQuery;
    qryIDPLANOPREV: TFloatField;
    qryIDTIPOCONTREMPTMO: TFloatField;
    qryPERCENTUAL: TFloatField;
    qryNOMEPLANO: TStringField;
    qryTCEDESCRICAO: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    btnBuscaContrato: TBitBtn;
    btnLimpaContrato: TBitBtn;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MS_Plano: TMontaSelect;
    MS_TipoContrEmptmo: TMontaSelect;
    qryDetIDUNIDCENTR: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDTIPOCONTREMPTMO: TFloatField;
    qryDetPERCENTUAL: TFloatField;
    qryDetNOME: TStringField;
    dblUnidCentr: TwwDBLookupCombo;
    dsUnidCentr: TwwDataSource;
    qryUnidCentr: TwwQuery;
    qryUnidCentrIDUNIDCENTR: TFloatField;
    qryUnidCentrNOME: TStringField;
    qryUnidCentrPERCENTUAL: TFloatField;
    procedure btnBuscaContratoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dblUnidCentrCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure sbtnInserirClick(Sender: TObject);
  private
    { Private declarations }
    iIdPlanoPrev       : Int64;
    iIdTipoContrEmptmo : Int64;
    sNomePlano         : String;
    sTceDescricao      : String;
  public
    { Public declarations }
  end;

var
  frmCadPlanTipCont: TfrmCadPlanTipCont;

implementation

uses dBaseDados, UFuncoesEmptmo, uMensErro, uSistema;

{$R *.DFM}




procedure TfrmCadPlanTipCont.btnBuscaContratoClick(Sender: TObject);
begin
   inherited;
   MS_Plano.Executar;
   if MS_Plano.RetornouValor then begin
      iIdPlanoPrev  := StrToInt(MS_Plano.ValoresChave[0]);
      sNomePlano    := MS_Plano.ValoresChave[1];
      if qry.State in dsEditModes then qryNOMEPLANO.AsString := sNomePlano;
   end;
end;



procedure TfrmCadPlanTipCont.BitBtn1Click(Sender: TObject);
begin
  inherited;
   MS_TipoContrEmptmo.Executar;
   if MS_TipoContrEmptmo.RetornouValor then begin
      iIdTipoContrEmptmo  := StrToInt(MS_TipoContrEmptmo.ValoresChave[0]);
      sTceDescricao       := MS_TipoContrEmptmo.ValoresChave[1];
      if qry.State in dsEditModes then qryTCEDESCRICAO.AsString := sTceDescricao;
   end;

end;



procedure TfrmCadPlanTipCont.bbtnConfirmarClick(Sender: TObject);
var
   iRecno : TBookMark;
   fTotal : Extended;
begin

   iRecno := qryDet.GetBookmark;
   qryDet.DisableControls;
   qryDet.First;
   fTotal := 0;
   while not qryDet.Eof do
   begin
      fTotal := fTotal + qryDetPERCENTUAL.AsFloat;
      qryDet.Next;
   end;
   qryDet.GotoBookmark(iRecno);
   qryDet.FreeBookmark(iRecno);
   qryDet.EnableControls;

//   if fTotal < qryPERCENTUAL.AsFloat then
//   begin
//      MsgDlg('Total informado (' + FormatFloat('##0.00',fTotal) + ') inferior ao do Total do Tipo de Contrato x Plano (' + FormatFloat('##0.00',qryPERCENTUAL.AsFloat) + ')','Empréstimo', mtWarning, [mbOk], 0);
//      Exit;
//   end;

   if fTotal > 100 then
   begin
      MsgDlg('Total informado (' + FormatFloat('##0.00',fTotal) + ') superior a 100%','Empréstimo', mtWarning, [mbOk], 0);
      Exit;
   end;

   if qry.State = dsInsert then begin
      qryIDPLANOPREV.AsInteger       := iIdPlanoPrev;
      qryIDTIPOCONTREMPTMO.AsInteger := iIdTipoContrEmptmo;
   end;

   qry.Post;
   qry.ApplyUpdates;

   if qryDet.UpdatesPending then qryDet.ApplyUpdates;
   qryDet.Close;
   
   LimpaParametros(qry);
   bbtnCancelarClick(Self);

   if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;
   
end;




procedure TfrmCadPlanTipCont.FormShow(Sender: TObject);
begin
  inherited;
   qryUnidCentr.Open;  
   LimpaParametros(qry);
   qry.ParamByName('PIDPLANOPREV').AsInteger       := -1;
   qry.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := -1;
   qry.Open;
   LimpaParametros(qryDet);
end;



procedure TfrmCadPlanTipCont.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qry.Close;
   qryDet.Close;
   qryUnidCentr.Close;
  inherited;

end;

procedure TfrmCadPlanTipCont.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   if MontaSelect.RetornouValor then begin
      LimpaParametros(qry);
      qry.ParamByName('PIDPLANOPREV').AsInteger       := StrToInt(MontaSelect.ValoresChave[0]);
      qry.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
      qry.Open;
      LimpaParametros(qryDet);
      qryDet.ParamByName('PIDPLANOPREV').AsInteger       := StrToInt(MontaSelect.ValoresChave[0]);
      qryDet.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := StrToInt(MontaSelect.ValoresChave[1]);
      qryDet.Open;
   end;
end;




procedure TfrmCadPlanTipCont.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
   qryDetIDPLANOPREV.AsInteger       := qryIDPLANOPREV.AsInteger;
   qryDetIDTIPOCONTREMPTMO.AsInteger := qryIDTIPOCONTREMPTMO.AsInteger;
end;



procedure TfrmCadPlanTipCont.bbtnOkDetClick(Sender: TObject);
begin
//  inherited;
   if qryDet.State in dsEditModes then begin
      if not qryDetIDUNIDCENTR.IsNull then begin
         qryDet.Post;
         if qry.State = dsEdit then begin
            qryDet.ApplyUpdates;
            qryDet.Close;
            qryDet.Open;
         end;
         bbtnCancelarDetClick(Self);
      end;
   end;

end;



procedure TfrmCadPlanTipCont.dblUnidCentrCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   qryDetIDUNIDCENTR.AsInteger := qryUnidCentrIDUNIDCENTR.AsInteger;
   qryDetNOME.AsString         := qryUnidCentrNOME.AsString;
   qryDetPERCENTUAL.AsFloat    := qryUnidCentrPERCENTUAL.AsFloat;
end;



procedure TfrmCadPlanTipCont.sbtnExcluiDetClick(Sender: TObject);
begin
//  inherited;
   qryDet.Delete;
   qryDet.ApplyUpdates;

end;



procedure TfrmCadPlanTipCont.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   if qryIDPLANOPREV.IsNull then begin
      Accept := False;
      Exit;
   end;

   if qryIDTIPOCONTREMPTMO.IsNull then begin
      Accept := False;
      Exit;
   end;
  inherited;

end;



procedure TfrmCadPlanTipCont.sbtnInserirClick(Sender: TObject);
begin
   if qry.State = dsInactive then qry.Open;
   inherited;

   LimpaParametros(qryDet);

   qryDet.ParamByName('PIDPLANOPREV').AsInteger       := -1;
   qryDet.ParamByName('PIDTIPOCONTREMPTMO').AsInteger := -1;
   qryDet.Open;
   
end;

end.
