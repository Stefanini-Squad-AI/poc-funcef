unit fMTConsSaldoContabGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, wwdblook,
  FSairAjuda, IvDictio, IvMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  fcLabel, Mask, wwdbedit, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, DBTables, Db, Wwdatsrc,
  Wwquery, wwdbdatetimepicker, CMDateTimePicker, TB97Tlwn, uCmSqlParams, DBClient,
  uCMClientDataSet, uCMTypes, uCtrlPadroes, uCtrlParamCAF, uCtrlGrupoContab,
  IvEMulti;

type
  TfrmMTConsSaldoContabGrupo = class(TfrmSairAjuda)
    pnlGrid: TPanel;
    dbgBalPatGrp: TwwDBGrid;
    dsBalPatGrp: TwwDataSource;
    MSGrupo: TMontaSelect;
    dsGrupo: TwwDataSource;
    Dock973: TDock97;
    ToolWindow971: TToolWindow97;
    sbtnGrupo: TSpeedButton;
    fcLabel2: TfcLabel;
    edCodGrupo: TMaskEdit;
    edDescGrupo: TMaskEdit;
    cdsGrupo: TCMClientDataSet;
    bbtnExecuta: TBitBtn;
    cdsBalPat: TCMClientDataSet;
    sqlBalPat: TCMSqlParams;
    cdsBalPatGrp: TCMClientDataSet;
    sqlBalPatGrp: TCMSqlParams;
    cdsGrpAnaliticos: TCMClientDataSet;
    sqlGrpAnaliticos: TCMSqlParams;
    cdsGrpSinteticos: TCMClientDataSet;
    sqlGrpSinteticos: TCMSqlParams;
    Dock972: TDock97;
    ToolWindow974: TToolWindow97;
    fcLabel4: TfcLabel;
    eddtafim: TCMDateTimePicker;
    fcLabel13: TfcLabel;
    dbcmbMoeda: TwwDBLookupCombo;
    fcLabel14: TfcLabel;
    dbcmbPais: TwwDBLookupCombo;
    dsMoeda: TwwDataSource;
    cdsMoeda: TCMClientDataSet;
    dsPais: TwwDataSource;
    cdsPais: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure sbtnGrupoClick(Sender: TObject);
    procedure eddtafimEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnExecutaClick(Sender: TObject);
  private
    { Private declarations }
    ParamCAF    : TCtrlParamCAF;
    GrupoContab : TCtrlGrupoContab;
    function ConvNum(fNum : Extended) : Extended;
  public
    { Public declarations }
    sMascaraGrupo : String;
  end;

var
  frmMTConsSaldoContabGrupo: TfrmMTConsSaldoContabGrupo;

implementation

uses uSistema, uMensErro;

{$R *.DFM}

function TfrmMTConsSaldoContabGrupo.ConvNum(fNum : Extended) : Extended;
begin
   Result := strtofloat(Format('%20.5f',[fNum]));
end;

procedure TfrmMTConsSaldoContabGrupo.FormCreate(Sender: TObject);
begin
   inherited;
   GrupoContab := TCtrlGrupoContab.Create;
   GrupoContab.InitializeAs(Padroes);
   //-------------------------------------------------------------------------------------
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   ParamCAF.CarregaProp(Sistema.IdEmpresa);
   edCodGrupo.EditMask := ParamCAF.MASCCODGRUPO + ';0; ';
   //-------------------------------------------------------------------------------------
   MSGrupo.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   cdsMoeda.Data := ParamCAF.ListaCAFMoedas(Sistema.IdEmpresa);
   cdsPais.Data := ParamCAF.ListaCAFPaises(Sistema.IdEmpresa);
   cdsMoeda.Locate('IDTIPOMOEDA', 1, []);
   cdsPais.First;
   dbcmbMoeda.Text := cdsMoeda.FieldByName('MOEDESC').AsString;
   dbcmbPais.Text := cdsPais.FieldByName('NOMEPAIS').AsString;
   //-------------------------------------------------------------------------------------
   edDtaFim.Date := Date;
   dbgBalPatGrp.Visible := False;
end;
//========================================================================================
procedure TfrmMTConsSaldoContabGrupo.FormActivate(Sender: TObject);
begin
   inherited;
   edDtaFim.SetFocus;
end;
//========================================================================================
procedure TfrmMTConsSaldoContabGrupo.sbtnGrupoClick(Sender: TObject);
begin
   inherited;
   dbgBalPatGrp.Visible := False;
   MSGrupo.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSGrupo.RetornouValor then
   begin
      cdsGrupo.Data := GrupoContab.ListaGrupoContab(Sistema.IdEmpresa,
                                                    StrToInt(MSGrupo.ValoresChave[0]));
      edCodGrupo.Text  := cdsGrupo.FieldByName('CLASSE').AsString;
      edDescGrupo.Text := cdsGrupo.FieldByName('NOME').AsString;
   end else
   begin
      cdsGrupo.Close;
      edCodGrupo.Text  := '';
      edDescGrupo.Text := '';
   end;
end;
//========================================================================================
procedure TfrmMTConsSaldoContabGrupo.bbtnExecutaClick(Sender: TObject);
var
   fValOrg, fCmBem, fDepLanc, fCmDep, fValCtb : Extended;
   iTam                                       : Integer;
   iDia, iMes, iAno                           : Word;
   dDtaIni                                    : TDatetime;

begin
   inherited;
   decodedate(edDtaFim.Date, iAno, iMes, iDia);
   dDtaIni := EncodeDate(iAno, iMes, 01);
   //-------------------------------------------------------------------------------------
   cdsBalPat.Close;
   sqlBalPat.Prepare;
   sqlBalPat.ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
   sqlBalPat.Open;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Analiticos
   //-------------------------------------------------------------------------------------
   cdsGrpSinteticos.Close;
   cdsGrpAnaliticos.Close;
   if edCodGrupo.Text <> '' then
   begin
      sqlGrpAnaliticos.SQL.Strings[28] := ' AND SB1.IDGRUPO = ' + cdsGrupo.FieldByName('IDGRUPO').AsString;
      sqlGrpAnaliticos.SQL.Strings[67] := ' AND SB2.IDGRUPO = ' + cdsGrupo.FieldByName('IDGRUPO').AsString;
   end else
   begin
      sqlGrpAnaliticos.SQL.Strings[28] := ' ';
      sqlGrpAnaliticos.SQL.Strings[67] := ' ';
   end;
   //-------------------------------------------------------------------------------------
   sqlGrpAnaliticos.SQL.Strings[29] := ' ';
   sqlGrpAnaliticos.SQL.Strings[68] := ' ';
   //-------------------------------------------------------------------------------------
   sqlGrpAnaliticos.SQL.Strings[30] := ' ';
   sqlGrpAnaliticos.SQL.Strings[69] := ' ';
   //-------------------------------------------------------------------------------------
   sqlGrpAnaliticos.SQL.Strings[31] := ' ';
   sqlGrpAnaliticos.SQL.Strings[70] := ' ';
   //-------------------------------------------------------------------------------------
   sqlGrpAnaliticos.Prepare;
   sqlGrpAnaliticos.ParamByName('IDPESSOA').AsFloat   := Sistema.IdEmpresa;
   sqlGrpAnaliticos.ParamByName('MOECODIGO').AsFloat  := cdsMoeda.FieldByName('MOECODIGO').AsInteger;
   sqlGrpAnaliticos.ParamByName('IDTAXADEP').AsFloat  := cdsPais.FieldByName('IDCAFPAISES').AsInteger;
   sqlGrpAnaliticos.ParamByName('DATAINI').AsDate     := dDtaIni;
   sqlGrpAnaliticos.ParamByName('DATASLD').AsDate     := edDtaFim.Date;
   sqlGrpAnaliticos.Open;
   //-------------------------------------------------------------------------------------
   while not cdsGrpAnaliticos.EOF do
   begin
      if cdsBalPat.Locate('IDGRUPO',cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger,[]) then
      begin
         while (not cdsGrpAnaliticos.EOF) and (cdsGrpAnaliticos.FieldByName('IDGRUPO').AsInteger = cdsBalPat.FieldByName('IDGRUPO').AsInteger) do
         begin
            cdsBalPat.Edit;
            cdsBalPat.FieldByName('VALORG').AsFloat  := cdsGrpAnaliticos.FieldByName('VALORG0').AsFloat;
            cdsBalPat.FieldByName('CMBEM').AsFloat   := cdsGrpAnaliticos.FieldByName('CMBEM0').AsFloat;
            cdsBalPat.FieldByName('DEPLANC').AsFloat := cdsGrpAnaliticos.FieldByName('DEPLANC0').AsFloat;
            cdsBalPat.FieldByName('CMDEP').AsFloat   := cdsGrpAnaliticos.FieldByName('CMDEP0').AsFloat;
            cdsBalPat.FieldByName('VALCTB').AsFloat  := cdsGrpAnaliticos.FieldByName('VALCTB0').AsFloat;
            cdsBalPat.Post;
            //----------------------------------------------------------------------------
            cdsGrpAnaliticos.Next;
         end;
      end else
      begin
         cdsGrpAnaliticos.Next;
      end;
   end;
   cdsGrpAnaliticos.Close;
   //-------------------------------------------------------------------------------------
   // Calcula os Grupos Sintéticos
   //-------------------------------------------------------------------------------------
   cdsGrpSinteticos.Close;
   sqlGrpSinteticos.SQL.Strings[4] := ' ';
   //-------------------------------------------------------------------------------------
   sqlGrpSinteticos.Prepare;
   sqlGrpSinteticos.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   sqlGrpSinteticos.Open;
   //-------------------------------------------------------------------------------------
   while not cdsGrpSinteticos.EOF do
   begin
      iTam     := length(trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString));
      fValOrg  := 0;
      fCmBem   := 0;
      fDepLanc := 0;
      fCmDep   := 0;
      fValCtb  := 0;
      //----------------------------------------------------------------------------------
      if cdsBalPat.Locate('CLASSE',trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString),[loPartialKey]) then
      begin
         while (not cdsBalPat.EOF) and
               (copy(trim(cdsBalPat.FieldByName('CLASSE').AsString),1,iTam) = trim(cdsGrpSinteticos.FieldByName('CLASSE').AsString)) do
         begin
            fValOrg  := ConvNum(fValOrg + cdsBalPat.FieldByName('VALORG').AsFloat);
            fCmBem   := ConvNum(fCmBem + cdsBalPat.FieldByName('CMBEM').AsFloat);
            fDepLanc := ConvNum(fDepLanc + cdsBalPat.FieldByName('DEPLANC').AsFloat);
            fCmDep   := ConvNum(fCmDep + cdsBalPat.FieldByName('CMDEP').AsFloat);
            fValCtb  := ConvNum(fValCtb + cdsBalPat.FieldByName('VALCTB').AsFloat);
            //----------------------------------------------------------------------------
            cdsBalPat.Next;
         end;
         //-------------------------------------------------------------------------------
         if cdsBalPat.Locate('CLASSE',cdsGrpSinteticos.FieldByName('CLASSE').AsString,[]) then
         begin
            cdsBalPat.Edit;
            cdsBalPat.FieldByName('VALORG').AsCurrency  := fValOrg;
            cdsBalPat.FieldByName('CMBEM').AsCurrency   := fCmBem;
            cdsBalPat.FieldByName('DEPLANC').AsCurrency := fDepLanc;
            cdsBalPat.FieldByName('CMDEP').AsCurrency   := fCmDep;
            cdsBalPat.FieldByName('VALCTB').AsCurrency  := fValCtb;
            cdsBalPat.Post;
         end;
      end;
      //----------------------------------------------------------------------------------
      cdsGrpSinteticos.Next;
   end;
   cdsGrpSinteticos.Close;
   //-------------------------------------------------------------------------------------
   // Transferindo os dados calculados para o dataset
   //-------------------------------------------------------------------------------------
   cdsBalPatGrp.Close;
   sqlBalPatGrp.Open;
   TStringField(cdsBalPatGrp.FieldByName('CLASSE')).EditMask := ParamCAF.MASCCODGRUPO + ';0; ';
   TFloatField(cdsBalPatGrp.FieldByName('VALORG')).DisplayFormat  := '#,##0.00;(#,##0.00); ';
   TFloatField(cdsBalPatGrp.FieldByName('CMBEM')).DisplayFormat   := '#,##0.00;(#,##0.00); ';
   TFloatField(cdsBalPatGrp.FieldByName('DEPLANC')).DisplayFormat := '#,##0.00;(#,##0.00); ';
   TFloatField(cdsBalPatGrp.FieldByName('CMDEP')).DisplayFormat   := '#,##0.00;(#,##0.00); ';
   TFloatField(cdsBalPatGrp.FieldByName('VALCTB')).DisplayFormat  := '#,##0.00;(#,##0.00); ';
   //-------------------------------------------------------------------------------------
   cdsBalPat.First;
   while not cdsBalPat.EOF do
   begin
      if (((cdsBalPat.FieldByName('VALORG').AsFloat + cdsBalPat.FieldByName('CMBEM').AsFloat) -
           (cdsBalPat.FieldByName('DEPLANC').AsFloat + cdsBalPat.FieldByName('CMDEP').AsFloat) <> 0)) then
      begin
         cdsBalPatGrp.Append;
         cdsBalPatGrp.FieldByName('IDGRUPO').AsInteger := cdsBalPat.FieldByName('IDGRUPO').AsInteger;
         cdsBalPatGrp.FieldByName('CLASSE').AsString := cdsBalPat.FieldByName('CLASSE').AsString;
         cdsBalPatGrp.FieldByName('DESCGRUPO').AsString := cdsBalPat.FieldByName('DESCGRUPO').AsString;
         cdsBalPatGrp.FieldByName('S_A').AsString := cdsBalPat.FieldByName('S_A').AsString;
         cdsBalPatGrp.FieldByName('VALORG').AsCurrency := cdsBalPat.FieldByName('VALORG').AsFloat;
         cdsBalPatGrp.FieldByName('CMBEM').AsCurrency := cdsBalPat.FieldByName('CMBEM').AsFloat;
         cdsBalPatGrp.FieldByName('DEPLANC').AsCurrency := cdsBalPat.FieldByName('DEPLANC').AsFloat;
         cdsBalPatGrp.FieldByName('CMDEP').AsCurrency := cdsBalPat.FieldByName('CMDEP').AsFloat;
         cdsBalPatGrp.FieldByName('VALCTB').AsCurrency := cdsBalPat.FieldByName('VALCTB').AsFloat;
         cdsBalPatGrp.Post;
      end;
      //----------------------------------------------------------------------------------
      cdsBalPat.Next;
   end;
   cdsBalPat.Close;
   //-------------------------------------------------------------------------------------
   cdsBalPatGrp.First;
   dbgBalPatGrp.Visible := True;
end;
//========================================================================================
procedure TfrmMTConsSaldoContabGrupo.eddtafimEnter(Sender: TObject);
begin
   inherited;
   dbgBalPatGrp.Visible := False;
end;
//========================================================================================
procedure TfrmMTConsSaldoContabGrupo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsGrupo.Close;
   cdsGrpAnaliticos.Close;
   cdsGrpSinteticos.Close;
   cdsBalPat.Close;
   cdsBalPatGrp.Close;
   ParamCAF.Free;
   GrupoContab.Free;
end;

end.
