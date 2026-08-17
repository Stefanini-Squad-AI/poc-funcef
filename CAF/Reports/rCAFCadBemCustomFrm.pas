unit rCAFCadBemCustomFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, fParamReports_Padrao, CmParamReport, IvDictio, IvMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, DB, Wwdatsrc, wwdbdatetimepicker, CMDateTimePicker,
  uCmSqlParams, DBClient, uCMClientDataSet, IvEMulti, fcLabel;

type
  TRptCAFCadBemCustomFrm = class(TfrmParamReports_Padrao)
    grpMovim: TGroupBox;
    dteDataMov: TCMDateTimePicker;
    bbtnSelBens: TBitBtn;
    Label1: TLabel;
    eSubTitulo: TEdit;
    dsDet: TwwDataSource;
    dbgrdDet: TwwDBGrid;
    cdsDet: TCMClientDataSet;
    sqlDet: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    edSelBens1: TMemo;
    lblQtd: TfcLabel;
    edSelBens2: TMemo;
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
  RptCAFCadBemCustomFrm: TRptCAFCadBemCustomFrm;

implementation

{$R *.dfm}

uses fMTSelMultiBem, uSistema, uMensErro;

procedure TRptCAFCadBemCustomFrm.FormCreate(Sender: TObject);
begin
   inherited;
   sqlParamCaf.Prepare;
   sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
   sqlParamCaf.Open;
   bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
   //-------------------------------------------------------------------------------------
   dteDataMov.Text := DataUltFechamento;
   eSubTitulo.Text := '';
   lblQtd.Caption := ' ';
   sqlDet.Open;
end;

function TRptCAFCadBemCustomFrm.DataUltFechamento : String;
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

procedure TRptCAFCadBemCustomFrm.bbtnSelBensClick(Sender: TObject);
var
   iQtd : Integer;

begin
   inherited;
   Application.CreateForm(TfrmMTSelMultiBem,frmMTSelMultiBem);
   frmMTSelMultiBem.FormStyle := FsNormal;
   frmMTSelMultiBem.Visible   := False;
   frmMTSelMultiBem.Top       := 84;
   frmMTSelMultiBem.ShowModal;
   //-------------------------------------------------------------------------------------
   iQtd := 0;
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
            iQtd := iQtd + 1;
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
   //-------------------------------------------------------------------------------------
   if iQtd = 0 then
   begin
      lblQtd.Caption := ' ';
   end else
   if iQtd = 1 then
   begin
      lblQtd.Caption := '1 Bem Selecionado';
   end else
   begin
      lblQtd.Caption := inttostr(iQtd) + ' Bens Selecionados';
   end;
end;

procedure TRptCAFCadBemCustomFrm.bbtnConfirmarClick(Sender: TObject);
var
   slBem : TStrings;

begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Parâmetros Básicos
   //-------------------------------------------------------------------------------------
   Cmp_Padrao.ParamValues[0].AsDateTime := dteDataMov.Date;
   Cmp_Padrao.ParamValues[1].AsString := eSubTitulo.Text;
   //-------------------------------------------------------------------------------------
   // Monta a Lista de Bens que serão Impressos
   //-------------------------------------------------------------------------------------
   slBem := TStringList.Create;
   try
      cdsDet.DisableControls;
      try
         cdsDet.First;
         while not cdsDet.EOF do
         begin
            slBem.Add(cdsDet.FieldByName('IDBEM').AsString);
            cdsDet.Next;
         end;
      finally
         cdsDet.EnableControls;
      end;
      //----------------------------------------------------------------------------------
      Cmp_Padrao.ParamValues[2].AsString := slBem.Text;
      Cmp_Padrao.ParamValues[3].AsString := '';
      //----------------------------------------------------------------------------------
   finally
      slBem.Free;
   end;
   //-------------------------------------------------------------------------------------
   lblQtd.Caption := ' ';
end;

procedure TRptCAFCadBemCustomFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsDet.Close;
   cdsParamCAF.Close;
end;

end.
