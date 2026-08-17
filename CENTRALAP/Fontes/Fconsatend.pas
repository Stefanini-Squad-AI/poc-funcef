{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

              Analista Responsável: Gustavo Viegas

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : Complemento da pendência 23998
Responsável : Daniel Simões
Data        : 02/03/2007
Descrição   : Ajuste realizado na tela Consulta Atendimentos para passar a
              exibir o número da RUBS...
--------------------------------------------------------------------------------
Pendência   :
Responsável : André Tavares
Data        : 16/01/2002
Descrição   : Alterado em conforme solicitacoes.
--------------------------------------------------------------------------------
Pendência   :
Responsável : André Tavares
Data        : 15/09/2000
Unit        : FConsAtend
Descrição   : Na tela de consulta atendimento (Relatório/Atendimentos) o filtro
              por matrícula só está retornando dados se for preenchida toda a
              matrícula, inclusive com o dígito (e-mail enviado em 18/12).
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit Fconsatend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery, Wwdatsrc,
  Grids, Wwdbigrd, Mask, DBCtrls,
  DBCGrids, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmConsAtend = class(TfrmOkCancelar)
    ds: TwwDataSource;
    qryatend: TwwQuery;
    qryatendCODATEND: TFloatField;
    qryatendCOMPLCODATEND: TFloatField;
    qryatendDATAINICIO: TDateTimeField;
    qryatendDATA: TDateTimeField;
    qryatendTEMPOATENDIMENTO: TFloatField;
    qryatendNOMESOLICITANTE: TStringField;
    qryatendTITULAR: TStringField;
    qryatendCPF: TStringField;
    qryatendMATRICULA: TStringField;
    qryatendCODATENDENTE: TStringField;
    qryatendNOMEUSUARIO: TStringField;
    qryatendSTATUS: TStringField;
    qryatendTIPO: TStringField;
    qryatendPATRO: TStringField;
    qryatendDESCCPUATEND: TStringField;
    qryatendDESCLOCALATEND: TStringField;
    qryatendPERGUNTA: TStringField;
    qryatendRESPOSTA: TStringField;
    qryatendOBSERVACAO: TStringField;
    qryatendIDATEND: TFloatField;
    qryformaatend: TwwQuery;
    qryformaatendIDTIPOATEND: TFloatField;
    qryformaatendNOME: TStringField;
    dsformaatend: TwwDataSource;
    dspatro: TwwDataSource;
    qrypatro: TwwQuery;
    qrypatroIDPESSOA: TFloatField;
    qrypatroNOME: TStringField;
    qryatendent: TwwQuery;
    qryatendentIDUSUARIO: TFloatField;
    qryatendentNOMEUSUARIO: TStringField;
    dsatend: TwwDataSource;
    QrySituCad: TwwQuery;
    QrySituCadDESCRICAO: TStringField;
    QrySituCadIDSITPART: TFloatField;
    qryfilial: TwwQuery;
    qryfilialNOME: TStringField;
    qryfilialIDPESSOA: TFloatField;
    QtyLocalAtend: TwwQuery;
    QtyLocalAtendDESCLOCALATEND: TStringField;
    QtyLocalAtendIDLOCALATEND: TFloatField;
    QryPlanPrev: TwwQuery;
    QryPlanPrevNOME: TStringField;
    QryPlanPrevIDPLANOPREV: TFloatField;
    QryAssuntoxAtend: TwwQuery;
    QryAssuntoxAtendNOME: TStringField;
    QryAssuntoxAtendEXISTERAD: TFloatField;
    QryAssuntoxAtendEXISTERUB: TFloatField;
    QryAssuntoxAtendIDPROCESSO: TFloatField;
    QryAssuntoxAtendIDRUBS: TFloatField;
    QryAssuntoxAtendIDATEND: TFloatField;
    QryAssuntoxAtendDESCRESPATEN: TMemoField;
    DsAssuntoxAtend: TwwDataSource;
    bbtnConsultar: TBitBtn;
    PagConsulta: TPageControl;
    TbsFiltro: TTabSheet;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label29: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cmbpatro: TwwDBLookupCombo;
    cmbatend: TwwDBLookupCombo;
    cmbforma: TwwDBLookupCombo;
    cmbstatus: TComboBox;
    GroupBox4: TGroupBox;
    Label15: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    edmatricula: TEdit;
    edcpf: TEdit;
    ednome: TEdit;
    edinsc: TEdit;
    cmbfilial: TwwDBLookupCombo;
    dataini: TCMDateTimePicker;
    datafin: TCMDateTimePicker;
    CmbPlanPrev: TwwDBLookupCombo;
    CmbSitcad: TwwDBLookupCombo;
    CmbLocalAtend: TwwDBLookupCombo;
    TbsResultado: TTabSheet;
    PgResposta: TPageControl;
    TbsGeral: TTabSheet;
    TbsAssuntos: TTabSheet;
    GrdAssuntoxAtend: TwwDBGrid;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBNavigator1: TDBNavigator;
    Bevel2: TBevel;
    DBText1: TDBText;
    qryatendLABELCOUNT: TStringField;
    qryatendNUMEROTELSOLIC: TStringField;
    Label34: TLabel;
    Label35: TLabel;
    EdtMaskCodAtend: TMaskEdit;
    EdtMaskCompl: TMaskEdit;
    Label36: TLabel;
    QryAssuntoxAtendDESCGRUPOASSUNTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure cmbpatroEnter(Sender: TObject);
    procedure bbtnConsultarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    iNumReg:Integer;
  public
    { Public declarations }
  end;

var
  frmConsAtend: TfrmConsAtend;

implementation

uses FPrincipal;

{$R *.DFM}

procedure TfrmConsAtend.FormCreate(Sender: TObject);
begin
  inherited;
  QryAssuntoxAtend.Open;
  PagConsulta.ActivePage := TbsFiltro;
end;

procedure TfrmConsAtend.cmbpatroEnter(Sender: TObject);
begin
  inherited;
  If (Sender IS TWwDbLookupCombo) And
     ((Sender AS TWwDbLookupCombo).LookupTable <> NIL) And
      Not (Sender AS TWwDbLookupCombo).LookupTable.Active Then
          (Sender AS TWwDbLookupCombo).LookupTable.Open;
end;

procedure TfrmConsAtend.bbtnConsultarClick(Sender: TObject);
var
   sSql1   : string;
begin
  inherited;

  If qryatend.Active Then qryatend.close;
  qryatend.sql.clear;

  sSql1 := sSql1 + '   (AT.IDTITULAR = P.IDPESSOA) AND ' +
                   '   (X.IDLOCALATENDXCPU(+) = AT.IDLOCALATENDXCPU) AND ' +
                   '   (X.IDCPUATEND = C.IDCPUATEND(+) )AND ' +
                   '   (X.IDLOCALATEND = L.IDLOCALATEND(+)) AND ' +
                   '   (EL.IDPESSJUR = PJ.IDPESSOA) AND ' +
                   '   (EL.IDPESSOA = AT.IDTITULAR) AND ' +
                   '   (TP.IDTIPOATEND = AT.IDTIPOATEND) AND ' +
                   '   (PREV.IDPESSOA(+) = EL.IDPESSOA) AND ' +
                   '   (PREV.IDPESSJUR(+) = EL.IDPESSJUR) AND ' +
                   '   (EL.IDPESSJUR = AT.IDPESSJUR) AND ' +
                   '   (US.IDUSUARIO = TO_NUMBER(AT.CODATENDENTE)) ';
//inicio alteracao andre 20/03/2002
  if edmatricula.text <> '' then sSQL1 := sSql1 + ' and el.matricula like '''+trim(edmatricula.text)+'%'' ';
  if EdtMaskCodAtend.text <> '' then sSQL1 := sSql1 + ' AND AT.CODATEND = '''+trim(EdtMaskCodAtend.text)+'''';
  if EdtMaskCompl.text <> ''    then  sSQL1 := sSql1 + ' AND AT.COMPLCODATEND = '''+trim(EdtMaskCompl.text)+'''';
  if edcpf.text       <> '' then sSQL1 := sSql1 + ' and p.numdocumento = '''+edcpf.text+'''' ;
  if edinsc.text      <> '' then sSQL1 := sSql1 + ' and PREV.INSCRICAONUMERO = '+trim(edinsc.text) ;
  if ednome.text      <> '' then
  begin
    // tavares 28/01/2003 - Resolução da pendência 11744
    sSQL1 := sSql1 + ' AND  UPPER(P.NOME) LIKE '+UpperCase(QuotedStr('%'+trim(ednome.text)+'%'));
  end;
  if dataini.text     <> '' then ssql1 := ssql1 + ' AND AT.DATA >= to_date('''+dataini.text+' 00:00:01'',''dd/mm/yyyy hh24:mi:ss'') ';
  if datafin.text     <> '' then ssql1 := ssql1 + ' AND  AT.DATA <= to_date('''+datafin.text+' 23:59:59'',''dd/mm/yyyy hh24:mi:ss'') ';
  if cmbpatro.text    <> '' then ssql1 := ssql1 + ' AND  EL.IDPESSJUR = '+qrypatro.fieldbyname('idpessoa').AsString;
  if cmbatend.text    <> '' then ssql1 := ssql1 + ' AND  AT.CODATENDENTE = '''+qryatendent.fieldbyname('idusuario').AsString+'''';
  if cmbfilial.text   <> '' then ssql1 := ssql1 + ' AND  EL.IDESTAB = '+qryfilial.fieldbyname('idpessoa').AsString;
  if cmbstatus.text   <> '' then ssql1 := ssql1 + ' AND  AT.STATUS = '''+TRIM(cmbstatus.text)+'''';
  if cmbforma.text    <> '' then ssql1 := ssql1 + ' AND  AT.IDTIPOATEND = '+qryformaatend.fieldbyname('idtipoatend').AsString;
  if CmbLocalAtend.text <> '' then ssql1 := ssql1 + ' AND  L.IDLOCALATEND = '+CmbLocalAtend.LOOKUPVALUE;
  if CmbSitcad.text <> '' then ssql1 := ssql1 + ' AND  PREV.IDSITPART = '+CmbSitcad.LOOKUPVALUE;
  if CmbPlanPrev.text <> '' then ssql1 := ssql1 + ' AND  PREV.IDPLANOPREV = '+CmbPlanPrev.LOOKUPVALUE;


  qryatend.sql.Text := '  SELECT AT.IDATEND, AT.CODATEND, AT.COMPLCODATEND, AT.NOMESOLICITANTE,AT.NUMEROTELSOLIC, ' +
                       '  AT.CODATENDENTE ,AT.DATA , AT.STATUS, AT.OBSERVACAO, ' +
                       '  TP.NOME AS TIPO , ' +
                       '  EL.MATRICULA , ' +
                       '  P.NUMDOCUMENTO AS CPF, P.NOME AS TITULAR , PJ.NOME AS PATRO, ' +
                       '  US.NOMEUSUARIO, AT.DATAINICIO, ((AT.DATA - AT.DATAINICIO)*86400) AS TEMPOATENDIMENTO, ' +
                       '  AT.PERGUNTA, AT.RESPOSTA, C.DESCCPUATEND, L.DESCLOCALATEND ' +
                       '  FROM ' +
                       '  ATEND  AT , TIPOATEND  TP , ELEGPATRO  EL, PESSOA  P , ' +
                       '  PESSOA  PJ, USUARIOSISTEMA  US, PARTPREVPLAN  PREV, ' +
                       '  LOCALATENDXCPU  X, CPUATEND  C, LOCALATEND  L ' +
                       '  WHERE ' + sSql1 + ' ORDER BY AT.DATA ';
  iNumReg := 0;
  qryatend.Open;
  PagConsulta.ActivePage := TbsResultado;
end;

procedure TfrmConsAtend.FormShow(Sender: TObject);
begin
  inherited;
  edmatricula.SetFocus;
end;

end.
