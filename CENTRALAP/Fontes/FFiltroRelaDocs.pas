{ André Tavares 09/07/2003  - resolução da pendência 14466
  André Tavares 11/07/2003  - resolução da pendência 14496
  André Tavares 20/08/2003  - resolução da pendência 14880
  André Tavares 20/08/2003  - resolução da pendência 18141 -  alterada o order by da query do relatório, pois estava intercalando os grupos }
unit FFiltroRelaDocs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, wwdblook, Db, DBTables,
  Wwquery, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, ppProd, ppClass, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppCtrls,
  ppPrnabl, ppBands, ppCache, dRelCentralAP, MontaSelect;

type
  TFrmFiltroRelaDocs = class(TfrmOkCancelar)
    DblkGrupo: TwwDBLookupCombo;
    DTPDataInicial: TwwDBDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    qrySecao: TwwQuery;
    DTPDataFinal: TwwDBDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdtMatricula: TEdit;
    EdtNome: TEdit;
    BitBtn1: TBitBtn;
    MsParticipDepen: TMontaSelect;
    qryatend: TwwQuery;
    qryatendIDUSUARIO: TFloatField;
    qryatendNOMEUSUARIO: TStringField;
    cmbatend: TwwDBLookupCombo;
    Label2a: TLabel;
    qryBenefServ: TwwQuery;
    qryBenefServNOME: TStringField;
    qryBenefServIDBENEFSERV: TFloatField;
    dblkBenefServ: TwwDBLookupCombo;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Sfiltro : string;
  public
    { Public declarations }
  end;

var
  FrmFiltroRelaDocs: TFrmFiltroRelaDocs;

implementation

{$R *.DFM}

procedure TFrmFiltroRelaDocs.FormCreate(Sender: TObject);
begin
  inherited;
  sFiltro := '';
  qrySecao.Close;
  qrySecao.Open;
  qryAtend.Close;
  qryAtend.Open;
  qryBenefServ.Close;
  qryBenefServ.Open;
end;

procedure TFrmFiltroRelaDocs.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;

  if dblkBenefServ.Text <> '' then
  begin
    SFiltro := SFiltro + ' AND RB.IDBENEFICIO = ' + dblkBenefServ.LookupValue;
  end;

  if cmbAtend.Text <> '' then
  begin
    SFiltro := SFiltro + ' AND SUBSTR(RB.TRGUSERINCLUSAO, 3, 30) = ' + cmbAtend.LookupValue;
  end;

  if DTPdataInicial.Text <> '' then
    SFiltro := SFiltro + ' AND TP.DATARECEB >= :dataIni ';

  if (DTPdataInicial.Text <> '') and (DTPdataFinal.Text <> '') then
    SFiltro := SFiltro + ' AND TP.DATARECEB <= :dataFin ';

  if dblkGrupo.text <> '' then
    SFiltro := SFiltro+ ' AND TP.IDGRUPO = ' + dblkGrupo.LookupValue;

  dtmRelCentralAP.qryRelaDocsReceb.Close;
  dtmRelCentralAP.qryRelaDocsReceb.Sql.Clear;
  {tavares 24/01/2003  - pendência 11665 com inclusão de campo no relatório
  esta query foi substituída pela query abaixo.
  dtmRelCentralAP.qryRelaDocsReceb.Sql.text := ' SELECT '+#13#10+
                               '    EL.MATRICULA, '+#13#10+
                               '    P.NOME, '+#13#10+
                               '    DOC.NOMEDOCUMENTO, '+#13#10+
                               '    TP.DATARECEB, '+#13#10+
                               '    GA.NOMEGRUPO, '+#13#10+
                               '    TP.IDGRUPO, '+#13#10+
                               '    RB.IDRUBS '+#13#10+
                               ' from TIPODOCXRUB TP, RUBXBENEFICIO RB, DOCUMENTOS DOC, GRUPOACESSO GA, ELEGPATRO EL, PESSOA P '+#13#10+
                               ' WHERE     DOC.IDDOCUMENTO = TP.IDDOCUMENTO(+) AND '+#13#10+
                               '           TP.IDGRUPO = GA.IDGRUPO AND '+#13#10+
                               '           TP.IDRUBXBENEFICIO = RB.IDRUBXBENEFICIO AND '+#13#10+
                               '           EL.IDPESSOA = RB.IDPESSOA AND '+#13#10+
                               '           RB.IDPESSOA = P.IDPESSOA AND '+#13#10+
                               '           TP.IDGRUPO IS NOT NULL '+#13#10+ SFiltro +
                               ' ORDER BY IDGRUPO ';
}

  dtmRelCentralAP.qryRelaDocsReceb.Sql.text :=
  ' SELECT DISTINCT                                                '+#13#10+
  '    NVL(DPT.MATRICULA, EL.MATRICULA) AS MATRICULA,           '+#13#10+
  '    P.NOME,                                                  '+#13#10+
  '    DOC.NOMEDOCUMENTO,                                       '+#13#10+
  '    TP.DATARECEB,                                            '+#13#10+
  '    GA.NOMEGRUPO,                                            '+#13#10+
  '    TP.IDGRUPO,                                              '+#13#10+
  '    TP.OBS,                                                  '+#13#10+
  '    RB.IDRUBS,                                               '+#13#10+
  '    BENEFSERV.NOME AS BENEFICIOSERVICO                       '+#13#10+
  ' FROM TIPODOCXRUB TP, RUBXBENEFICIO RB, DOCUMENTOS DOC,      '+#13#10+
  '      GRUPOACESSO GA, DEPENTIT DPT  , PESSOA P, ELEGPATRO EL,  '+#13#10+
  ' (                                                           '+#13#10+
  '   SELECT                                                    '+#13#10+
  '     SE.NOME, se.idservicos as idbenefserv                   '+#13#10+
  '   FROM                                                      '+#13#10+
  '     SERVICO SE                                              '+#13#10+
  '   UNION                                                     '+#13#10+
  '   SELECT                                                    '+#13#10+
  '     BE.NOME, be.idbeneficio as idbenefserv                  '+#13#10+
  '   FROM                                                      '+#13#10+
  '   BENEFICIO BE                                              '+#13#10+
  ' ) BENEFSERV                                                 '+#13#10+
  ' WHERE   DOC.IDDOCUMENTO = TP.IDDOCUMENTO(+) AND             '+#13#10+
  '         TP.IDGRUPO = GA.IDGRUPO AND                         '+#13#10+
  '         TP.IDRUBXBENEFICIO = RB.IDRUBXBENEFICIO AND         '+#13#10+
  ' DPT.IDPESSOA = RB.IDPESSOA AND DPT.IDPESSOA = EL.IDPESSOA(+) AND '+#13#10+
  '        DPT.IDTITULAR = RB.IDTITULAR AND                     '+#13#10+
  '         RB.IDPESSOA = P.IDPESSOA AND                        '+#13#10+
  '         TP.IDGRUPO IS NOT NULL  AND                         '+#13#10+
  '         BENEFSERV.idbenefserv =  RB.IDBENEFICIO             '+#13#10 + SFiltro +
  ' ORDER BY TP.IDGRUPO, P.NOME, RB.IDRUBS  ';


  if DTPdataInicial.Text <> '' then
    dtmRelCentralAP.qryRelaDocsReceb.ParamByName('DataIni').asDate := DTPdataInicial.Date;

  if DTPdataFinal.Text <> '' then
    dtmRelCentralAP.qryRelaDocsReceb.ParamByName('DataFin').asDate := DTPdataFinal.Date;

  dtmRelCentralAP.qryRelaDocsReceb.Open;

end;

procedure TFrmFiltroRelaDocs.bbtnCancelarClick(Sender: TObject);
begin
  dblkGrupo.text      := '';
  DTPdataInicial.Text := '';
  DTPdataFinal.Text   := '';
end;

procedure TFrmFiltroRelaDocs.BitBtn1Click(Sender: TObject);
begin
  inherited;
  SFiltro := '';
  msParticipDepen.Executar;
  if msParticipDepen.RetornouValor then
  begin
    EdtMatricula.Enabled := true;
    EdtNome.Enabled      := true;
    EdtMatricula.text    := msParticipDepen.ValoresChave[15];
    EdtNome.text         := msParticipDepen.ValoresChave[0];
    EdtMatricula.Enabled := false;
    EdtNome.Enabled      := false;
    sFiltro := sFiltro + ' AND RB.IDPESSOA = ' + msParticipDepen.ValoresChave[9];
  end;

end;

procedure TFrmFiltroRelaDocs.FormShow(Sender: TObject);
begin
  inherited;
  SFiltro := '';
end;

end.
