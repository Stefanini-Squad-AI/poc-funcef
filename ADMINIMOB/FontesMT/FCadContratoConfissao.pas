{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit FCadContratoConfissao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fCadContratoImovelMT, uCmSqlParams, Provider, DBTables, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97,
  mArvoreCompl, mFiador, Wwdbgrd2, ComCtrls, wwriched, StdCtrls, Buttons,
  Wwdotdot, Wwdbcomb, ExtCtrls, DBCtrls, wwdbdatetimepicker,
  CMDateTimePicker, mImovelAtivo, Grids, Wwdbigrd, Wwdbgrid, mResponsavel,
  mAdministradora, wwdbedit, Wwdbspin, mLocatario, wwdblook, TREdit,
  TabControlDetalhe, Mask, DBCtrls2, uCtrlContratoImovel, uCtrlHistMovImob, uCtrlPadroes,
  CMDBLookupCombo, DBCGrids, uCtrlFormaCalcImob;

type
  TfrmCadContratoConfissao = class(TfrmCadContratoImovelMT)
    tbsCondicaoPag: TTabSheet;
    tbsHistorico: TTabSheet;
    grdHistorico: TwwDBGrid;
    cdsHistMovImob: TCMClientDataSet;
    dsHistMovImob: TDataSource;
    cdsHistMovImobEvento: TStringField;
    cdsHistMovImobFlgCentralizador: TIntegerField;
    Panel2: TPanel;
    chkCentraliza: TCheckBox;
    TabSheet1: TTabSheet;
    dsContratoConfessado: TDataSource;
    cdsContratoConfessado: TCMClientDataSet;
    cdsContratoConfessadoCONTRATO: TStringField;
    cdsContratoConfessadoNODOCUMENTO: TFloatField;
    cdsContratoConfessadoDATAVENCTO: TDateTimeField;
    cdsContratoConfessadoVALOR: TFloatField;
    GroupBox20: TGroupBox;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    edtDataAssinatura: TCMDateTimePicker;
    edtDataFim: TCMDateTimePicker;
    edtProxRevisao: TCMDateTimePicker;
    edtAvisoRevisao: TCMDateTimePicker;
    edtDataInicio: TCMDateTimePicker;
    DBCtrlGrid1: TDBCtrlGrid;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label101: TLabel;
    Label102: TLabel;
    DBEdit6: TDBEdit;
    Label103: TLabel;
    DBEdit7: TDBEdit;
    Label104: TLabel;
    gbIntervalo: TGroupBox;
    dbspnPeriodo: TwwDBSpinEdit;
    dbcbPerParc: TwwDBComboBox;
    dblcIndCorrec: TCMDBLookupCombo;
    lblIndCorrec: TLabel;
    DBEdit8: TDBEdit;
    lblPerProj2: TLabel;
    DBEdit9: TDBEdit;
    dbcbPerJur: TwwDBComboBox;
    lblPeriod: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    dbedtMesRefReajuste: TwwDBSpinEdit;
    DBEdit10: TDBEdit;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    GroupBox21: TGroupBox;
    cboFormaCalculo: TwwDBLookupCombo;
    cdsFormaCalcImob: TCMClientDataSet;
    Panel9: TPanel;
    Panel8: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    wwDBGrid1: TwwDBGrid;
    cdsConfDividaImobXOper: TCMClientDataSet;
    cdsConfDividaImobXOperDESCCUSTORECIMO: TStringField;
    cdsConfDividaImobXOperDESCTIPO: TStringField;
    cdsConfDividaImobXOperVLROPERACAO: TFloatField;
    cdsConfDividaImobXOperFLGTIPO: TStringField;
    cdsConfDividaImobXOperOBSERVACAO: TMemoField;
    cdsConfDividaImobXOperFLGDESCCONDIC: TFloatField;
    cdsConfDividaImobXOperDESCCOND: TStringField;
    cdsConfDividaImobXOperIDCONFDIVIDAIMOB: TFloatField;
    cdsConfDividaImobXOperIDTIPOCUSTORECIMO: TFloatField;
    dsConfissaoOper: TDataSource;
    wwDBGrid2: TwwDBGrid;
    CMSqlParams6: TCMSqlParams;
    cdsHistMovImobNOME: TStringField;
    cdsHistMovImobIDCONTRATOIMOVEL: TFloatField;
    cdsHistMovImobCONNUMERO: TStringField;
    cdsHistMovImobCONNOME: TStringField;
    cdsHistMovImobDESCCUSTORECIMO: TStringField;
    cdsHistMovImobIDHISTMOVIMOB: TFloatField;
    cdsHistMovImobIDCONDPAGIMOVEL: TFloatField;
    cdsHistMovImobIDTIPOCUSTORECIMO: TFloatField;
    cdsHistMovImobIDITEMCENTRALIZA: TFloatField;
    cdsHistMovImobHMIDATAMOV: TDateTimeField;
    cdsHistMovImobHMIVALOR: TFloatField;
    cdsHistMovImobHMIDOCUMENTO: TFloatField;
    cdsHistMovImobHMITIPOEVENTO: TFloatField;
    cdsHistMovImobPLNCODIGO: TFloatField;
    cdsHistMovImobHMIPARCELA: TFloatField;
    cdsHistMovImobDATAVENCIMENTO: TDateTimeField;
    cdsHistMovImobTIPOCONDPAG: TStringField;
    cdsHistMovImobIDCONDPAGIMOVEL_1: TFloatField;
    cdsConfDividaImobXOperCONDICAO: TStringField;
    cdsConfDividaImobXOperVLRFINANC: TFloatField;
    CMSqlParams5: TCMSqlParams;
    Label58: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure cdsHistMovImobCalcFields(DataSet: TDataSet);
    procedure chkCentralizaClick(Sender: TObject);
    procedure grdHistoricoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure grdHistoricoTopRowChanged(Sender: TObject);
    procedure sbtnImovelClick(Sender: TObject);
  private
    { Private declarations }
    CtrlHistMovImob    : TCtrlHistMovImob;
    CtrlFormaCalcImob  : TCtrlFormaCalcImob;

  public
    { Public declarations }
  end;

var
  frmCadContratoConfissao: TfrmCadContratoConfissao;

implementation

{$R *.DFM}
uses dMS, uSistema;



procedure TfrmCadContratoConfissao.FormCreate(Sender: TObject);
begin
   inherited;
   CtrlHistMovImob    := TCtrlHistMovImob.Create;
   CtrlHistMovImob.InitializeAs(Padroes);

   CtrlFormaCalcImob  := TCtrlFormaCalcImob.Create;
   CtrlFormaCalcImob.InitializeAs(Padroes);

   cdsFormaCalcImob.Data := CtrlFormaCalcImob.LookupFormaCalcImob(Sistema.IdModulo);
end;



procedure TfrmCadContratoConfissao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil(CtrlHistMovImob);
   FreeAndNil( CtrlFormaCalcImob );
   inherited;
end;



procedure TfrmCadContratoConfissao.sbtnProcurarClick(Sender: TObject);
var
   sFiltro       : String;
begin
   sFiltro       := dtmMS.MS_Contrato.Filtro.Text;
   dtmMS.MS_Contrato.Filtro.Text :=  'C.IDRESPONSAVEL = PR.IDPESSOA(+)' + #13 +
                                     'C.IDLOCATARIO = PL.IDPESSOA(+)'   + #13 +
                                     'C.IDRESPONSAVEL = U.IDUSUARIO(+)' + #13 +
                                     'C.IDTIPOCONTRIMOB = TC.IDTIPOCONTRIMOB(+)' + #13 +
                                     'C.FLGTIPOCONTRATO = ''D'''        + #13;

   inherited;
   dtmMS.MS_Contrato.Filtro.Text := sFiltro;
   if dtmMS.MS_Contrato.RetornouValor then begin
     cdsHistMovImob.Data           := CtrlHistMovImob.LookupHistMovImob(-1,-1,-1,-1,-1,-1,-1,StrToInt(dtmMS.MS_Contrato.ValoresChave[0]));
     cdsContratoConfessado.Data    := CtrlHistMovImob.LookupContratoConfessado(StrToInt(dtmMS.MS_Contrato.ValoresChave[0]));
     cdsConfDividaImobXOper.Data   := CtrlHistMovImob.LookupConfissaoOperacoes(StrToInt(dtmMS.MS_Contrato.ValoresChave[0]));
     chkCentralizaClick(Self);
   end;
end;



procedure TfrmCadContratoConfissao.cdsHistMovImobCalcFields(DataSet: TDataSet);
begin
   inherited;
   if cdsHistMovImob.FieldByName('HMITIPOEVENTO').AsInteger = 0 then cdsHistMovImob.FieldByName('EVENTO').AsString := 'Geração de Parcelas';
   if cdsHistMovImob.FieldByName('HMITIPOEVENTO').AsInteger = 1 then cdsHistMovImob.FieldByName('EVENTO').AsString := 'Geração de Descontos';
   if cdsHistMovImob.FieldByName('HMITIPOEVENTO').AsInteger = 2 then cdsHistMovImob.FieldByName('EVENTO').AsString := 'Amortização Extra';
   if cdsHistMovImob.FieldByName('HMITIPOEVENTO').AsInteger = 3 then cdsHistMovImob.FieldByName('EVENTO').AsString := 'Atualização de Saldo';

   if cdsHistMovImob.FieldByName('TIPOCONDPAG').AsString  = 'V' then cdsHistMovImob.FieldByName('EVENTO').AsString := 'Geração de Sinal';
   
   if cdsHistMovImob.FieldByName('IDTIPOCUSTORECIMO').AsInteger = cdsHistMovImob.FieldByName('IDITEMCENTRALIZA').AsInteger then
      cdsHistMovImob.FieldByName('FLGCENTRALIZADOR').AsInteger := 1
   else
      cdsHistMovImob.FieldByName('FLGCENTRALIZADOR').AsInteger := 0;
end;



procedure TfrmCadContratoConfissao.chkCentralizaClick(Sender: TObject);
begin
   inherited;
   if chkCentraliza.Checked then
   begin
      cdsHistMovImob.Filter   := 'IDTIPOCUSTORECIMO = IDITEMCENTRALIZA';
      cdsHistMovImob.Filtered := True;
   end
   else
   begin
      cdsHistMovImob.Filter   := '';
      cdsHistMovImob.Filtered := False;
   end;
end;



procedure TfrmCadContratoConfissao.grdHistoricoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
   if State <> [gdSelected] then begin
      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end else begin
            ABrush.Color := clWhite;
         end;
      end;

   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmCadContratoConfissao.grdHistoricoTopRowChanged(
  Sender: TObject);
begin
   inherited;
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmCadContratoConfissao.sbtnImovelClick(Sender: TObject);
var
    sFiltroImovel : String;
begin
   sFiltroImovel := dtmMS.MS_ImovelContrato.Filtro.Text;
   dtmMS.MS_ImovelContrato.Filtro.Text := 'I.IDIMOVELMESTRE = IM.IDIMOVEL'           + #13 +
                                          'I.IDIMOVEL = CX.IDIMOVEL'                 + #13 +
                                          'CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL' + #13 +
                                          'C.IDLOCATARIO = PL.IDPESSOA'              + #13 +
                                          'C.FLGTIPOCONTRATO = ''D'''                + #13;
   inherited;
   dtmMS.MS_ImovelContrato.Filtro.Text := sFiltroImovel;
end;



end.
