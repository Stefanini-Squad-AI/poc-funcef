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
    edSelBens2: TMemo;
    lblQtd: TfcLabel;
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

uses fSelBem, uSistema, uMensErro;

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
   Application.CreateForm(TfrmSelBem,frmSelBem);
   frmSelBem.FormStyle := FsNormal;
   frmSelBem.Visible   := False;
   frmSelBem.Top       := 84;
   frmSelBem.ShowModal;
   //-------------------------------------------------------------------------------------
   iQtd := 0;
   //-------------------------------------------------------------------------------------
   if frmSelBem.bResult then
   begin
      cdsDet.DisableControls;
      frmSelBem.cds.First;
      while not frmSelBem.cds.EOF do
      begin
         if frmSelBem.cds.FieldByName('PROCESSAR').AsInteger = 1 then
         begin
            cdsDet.Append;
            cdsDet.FieldByName('IDPESSOA').AsFloat := frmSelBem.cds.FieldByName('IDPESSOA').AsFloat;
            cdsDet.FieldByName('IDBEM').AsFloat    := frmSelBem.cds.FieldByName('IDBEM').AsFloat;
            cdsDet.FieldByName('PLACA').AsFloat    := frmSelBem.cds.FieldByName('PLACA').AsFloat;
            cdsDet.FieldByName('DESBEM').AsString  := frmSelBem.cds.FieldByName('DESBEM').AsString;
            cdsDet.Post;
            iQtd := iQtd + 1;
         end;
         //-------------------------------------------------------------------------------
         frmSelBem.cds.Next;
      end;
      cdsDet.First;
      cdsDet.EnableControls;
   end;
   //-------------------------------------------------------------------------------------
   frmSelBem.cds.Close;
   frmSelBem.Release;
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
   iNBens : Integer;
   iLBens : Integer;
   sLinha1, sLinha2 : String;
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
   edSelBens1.Text := '';
   edSelBens2.Text := '';
   iNBens := 0;
   iLBens := 0;
   cdsDet.DisableControls;
   try
      cdsDet.First;
      while not cdsDet.EOF do
      begin
         if iNBens = 0 then
         begin
            sLinha1 := ' AND (B.IDBEM = ' + cdsDet.FieldByName('IDBEM').AsString;
            sLinha2 := ' AND (IDBEM = ' + cdsDet.FieldByName('IDBEM').AsString;
            iLBens := iLBens + 1
         end else
         begin
            if iLBens = 0 then
            begin
               sLinha1 := '      OR B.IDBEM = ' + cdsDet.FieldByName('IDBEM').AsString;
               sLinha2 := '      OR IDBEM = ' + cdsDet.FieldByName('IDBEM').AsString;
            end else
            begin
               sLinha1 := sLinha1 + ' OR B.IDBEM = ' + cdsDet.FieldByName('IDBEM').AsString;
               sLinha2 := sLinha2 + ' OR IDBEM = ' + cdsDet.FieldByName('IDBEM').AsString;
            end;
            iLBens := iLBens + 1
         end;
         //-------------------------------------------------------------------------------
         iNBens := iNBens + 1;
         cdsDet.Next;
         //-------------------------------------------------------------------------------
         if (iLBens > 10) or cdsDet.EOF then
         begin
            edSelBens1.Lines.Add(sLinha1);
            edSelBens2.Lines.Add(sLinha2);
            iLBens := 0;
         end;
      end;
   finally
      cdsDet.EnableControls;
   end;
   //-------------------------------------------------------------------------------------
   if iNBens <> 0 then
   begin
      edSelBens1.Lines.Add(') ');
      edSelBens2.Lines.Add(') ');
   end;
   //-------------------------------------------------------------------------------------
   Cmp_Padrao.ParamValues[2].AsString := edSelBens1.Text;
   Cmp_Padrao.ParamValues[3].AsString := edSelBens2.Text;
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
