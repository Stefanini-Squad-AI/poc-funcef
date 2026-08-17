unit rCAFProjSldCtbBemFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, fParamReports_Padrao, CmParamReport, IvDictio, IvMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid,
  uCmSqlParams, DB, DBClient, uCMClientDataSet, Wwdatsrc, IvEMulti;

type
  TrptCAFProjSldCtbBemFrm = class(TfrmParamReports_Padrao)
    dsDet: TwwDataSource;
    cdsDet: TCMClientDataSet;
    sqlDet: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    dbgrdDet: TwwDBGrid;
    edSelBens: TMemo;
    grpMovim: TGroupBox;
    dteDataMov: TCMDateTimePicker;
    bbtnSelBens: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelBensClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    bInvestImob : Boolean;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  rptCAFProjSldCtbBemFrm: TrptCAFProjSldCtbBemFrm;

implementation

{$R *.dfm}

uses fMTSelMultiBem, uSistema, uMensErro;

procedure TrptCAFProjSldCtbBemFrm.FormCreate(Sender: TObject);
begin
   inherited;
   sqlParamCaf.Prepare;
   sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
   sqlParamCaf.Open;
   bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
   //-------------------------------------------------------------------------------------
   dteDataMov.Text := DataUltFechamento;
   sqlDet.Open;
end;

function TrptCAFProjSldCtbBemFrm.DataUltFechamento: String;
var
   iGrupoDeprec,
   iGrupoDepIni,
   iGrupoDepFim : Integer;

begin
   //-------------------------------------------------------------------------------------
   // Calculo da data baseado na opção dos Parâmetros do CAF
   //-------------------------------------------------------------------------------------
   if Sistema.IdModulo = 7 then
   begin
      if not bInvestImob then
      begin
         iGrupoDeprec := 2;
      end else
      begin
         iGrupoDeprec := 0;
      end;
   end else
   begin
      iGrupoDeprec := 1;
   end;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   sqlVerUltFec.Prepare;
   sqlVerUltFec.ParamByName('PIDPESSOA').AsFloat       := Sistema.IdEmpresa;
   sqlVerUltFec.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   sqlVerUltFec.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   sqlVerUltFec.Open;
   //-------------------------------------------------------------------------------------
   if not cdsVerUltFec.IsEmpty then
      Result := DateToStr(cdsVerUltFec.FieldByName('DATAULT').AsDateTime)
   else
      Result := '';
   //-------------------------------------------------------------------------------------
   cdsVerUltFec.Close;
end;

procedure TrptCAFProjSldCtbBemFrm.bbtnSelBensClick(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TfrmMTSelMultiBem,frmMTSelMultiBem);
   frmMTSelMultiBem.FormStyle := FsNormal;
   frmMTSelMultiBem.Visible   := False;
   frmMTSelMultiBem.Top       := 84;
   frmMTSelMultiBem.ShowModal;
   //-------------------------------------------------------------------------------------
   if frmMTSelMultiBem.bResult then
   begin
      cdsDet.DisableControls;
      frmMTSelMultiBem.cds.First;
      while not frmMTSelMultiBem.cds.EOF do
      begin
         if frmMTSelMultiBem.cds.FieldByName('PROCESSAR').AsInteger = 1 then
         begin
            cdsDet.Append;
            cdsDet.FieldByName('IDPESSOA').AsFloat := frmMTSelMultiBem.cds.FieldByName('IDPESSOA').AsFloat;
            cdsDet.FieldByName('IDBEM').AsFloat    := frmMTSelMultiBem.cds.FieldByName('IDBEM').AsFloat;
            cdsDet.FieldByName('PLACA').AsFloat    := frmMTSelMultiBem.cds.FieldByName('PLACA').AsFloat;
            cdsDet.FieldByName('DESBEM').AsString  := frmMTSelMultiBem.cds.FieldByName('DESBEM').AsString;
            cdsDet.Post;
         end;
         //-------------------------------------------------------------------------------
         frmMTSelMultiBem.cds.Next;
      end;
      cdsDet.First;
      cdsDet.EnableControls;
   end;
   //-------------------------------------------------------------------------------------
   frmMTSelMultiBem.cds.Close;
   frmMTSelMultiBem.Release;
end;

procedure TrptCAFProjSldCtbBemFrm.bbtnConfirmarClick(Sender: TObject);
var
   iNBens : Integer;
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Parâmetros Básicos
   //-------------------------------------------------------------------------------------
   Cmp_Padrao.ParamValues[0].AsDateTime := dteDataMov.Date;
   //-------------------------------------------------------------------------------------
   // Monta a Lista de Bens que serão Impressos
   //-------------------------------------------------------------------------------------
   edSelBens.Text := '';
   iNBens := 0;
   cdsDet.DisableControls;
   cdsDet.First;
   while not cdsDet.EOF do
   begin
      if iNBens = 0 then
      begin
         edSelBens.Lines.Add('  AND (   (B.IDBEM = ' + cdsDet.FieldByName('IDBEM').AsString + ') ');
      end else
      begin
         edSelBens.Lines.Add('       OR (B.IDBEM = ' + cdsDet.FieldByName('IDBEM').AsString + ') ');
      end;
      //----------------------------------------------------------------------------------
      iNBens := iNBens + 1;
      cdsDet.Next;
   end;
   cdsDet.EnableControls;
   //-------------------------------------------------------------------------------------
   if iNBens <> 0 then
      edSelBens.Lines.Add('      ) ');
   //-------------------------------------------------------------------------------------
   Cmp_Padrao.ParamValues[2].AsString := edSelBens.Text;
end;

procedure TrptCAFProjSldCtbBemFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsDet.Close;
   cdsParamCAF.Close;
end;

end.
