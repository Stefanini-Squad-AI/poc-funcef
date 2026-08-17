{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão      : 5.10.18 em diante
Pendência   : 27753
Responsável : Daniel Simões
Data        : 24/04/2008
Descrição   : Correção de dados duplicados na query 'qryUsuarios' ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fFiltroRelaProtocolo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdbdatetimepicker, wwdblook, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables,
  Wwquery, CMProcuraSubTipo, CMProcura, MontaSelect, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, dRelCentralAP;

type
  TfrmFiltroRelaProtocolo = class(TfrmOkCancelar)
    DblkGrupoUsu: TwwDBLookupCombo;
    DblkGrupoProtocolo: TwwDBLookupCombo;
    DtpDataIni: TwwDBDateTimePicker;
    DtpDataFin: TwwDBDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    qryGrupoProtocolo: TwwQuery;
    qryGrupoProtocoloDESCRICAO: TStringField;
    qryGrupoProtocoloIDFIARASS: TFloatField;
    qryGrupoUsu: TwwQuery;
    qryGrupoUsuIDGRUPO: TFloatField;
    qryGrupoUsuNOMEGRUPO: TStringField;
    qryUsuarios: TwwQuery;
    Label1: TLabel;
    DblkUsuario: TwwDBLookupCombo;
    qryUsuariosNOMEUSUARIO: TStringField;
    qryUsuariosNOME: TStringField;
    qryUsuariosIDUSUARIO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    sFiltro : string;
  public
    { Public declarations }
  end;

var
  frmFiltroRelaProtocolo: TfrmFiltroRelaProtocolo;

implementation

{$R *.DFM}

procedure TfrmFiltroRelaProtocolo.FormCreate(Sender: TObject);
begin
  inherited;
  sFiltro := '';
  qryUsuarios.Close;
  qryUsuarios.Open;
  qryGrupoUsu.Close;
  qryGrupoUsu.Open;
  qryGrupoProtocolo.Close;
  qryGrupoProtocolo.Open;
end;

procedure TfrmFiltroRelaProtocolo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  sFiltro := '';
  if DblkUsuario.Text <> '' then
    sFiltro := sFiltro +' AND FI.IDUSUARIO = '+ DblkUsuario.LookupValue;
  if DblkGrupoUsu.Text <> '' then
  begin
    sFiltro := sFiltro + 'AND US.IDUSUARIO = GU.IDUSUARIO  AND  GU.IDGRUPO = GA.IDGRUPO AND GU.IDGRUPO = '+ dblkGrupoUsu.LookupValue;

  end;
  if DblkGrupoProtocolo.Text <> '' then
    sFiltro := sFiltro +' AND FI.IDGRUPO = '+ DblkGrupoProtocolo.LookupValue;

  if DTpDataIni.Text <> '' then
    sFiltro := sFiltro +' AND FI.DATAINCLUSAO >= :DATAINI ';
  if DTpDataFin.Text <> '' then
    sFiltro := sFiltro +' AND FI.DATAINCLUSAO <= :DATAFIN ';


  dtmRelCentralAP.qryRelaProtocolo.Close;
  dtmRelCentralAP.qryRelaProtocolo.sql.Clear;
  dtmRelCentralAP.qryRelaProtocolo.sql.text :=  ' SELECT '+#13#10+
                                '  VW.MATRICULA, '+#13#10+
                                '  VW.IDPESSOA, '+#13#10+
                                '  FI.IDFIARIOA, '+#13#10+
                                '  VW.NOME, '+#13#10+
                                '  NVL(T.DDD, ''-----'') AS DDD, '+#13#10+
                                '  NVL(T.NUMERO, ''---------------'') AS TELEFONE, '+#13#10+
                                '  FI.DESCRICAO AS ASSUNTO, '+#13#10+
                                '  NVL(TO_CHAR(FI.IDRUBS), ''-----------''), '+#13#10+
                                '  FI.IDUSUARIO, '+#13#10+
                                '  FI.DATAINCLUSAO,  '+#13#10+
                                '  FA.DESCRICAO AS GRUPOPROTOCOLO, '+#13#10+
                                '  US.IDUSUARIO, '+#13#10+
                                '  P.NOME, '+#13#10+
                                '  FI.IDGRUPO, '+#13#10+
                                '  NVL(GA.NOMEGRUPO, ''--------------------------------------'') AS NOMEGRUPO '+#13#10+
                                ' FROM USUARIOSISTEMA US, GRUPOUSU GU, '+#13#10+
                                '      GRUPOACESSO GA, FIARIO FI, FIARIOASSUNTO FA, '+#13#10+
                                '      VWPARTICIPDEPEN VW, TELENDPESS T, PESSOA P '+#13#10+
                                ' WHERE FI.IDUSUARIO   = US.IDUSUARIO AND '+#13#10+
                                '       US.IDUSUARIO   = GU.IDUSUARIO(+) AND '+#13#10+
                                '       GU.IDGRUPO     = GA.IDGRUPO(+)   AND '+#13#10+
                                '       FI.IDPESSOA    = VW.IDPESSOA  AND '+#13#10+
                                '       FI.IDGRUPO     = FA.IDFIARASS AND '+#13#10+
                                '       FI.IDPESSOA    = T.IDTELEFONE(+) AND '+#13#10+
                                '       FI.IDUSUARIO = P.IDPESSOA '+#13#10+ sFiltro+
                                ' ORDER BY FI.IDGRUPO,   NOMEGRUPO,  P.NOME '+#13#10;



  if DTpDataIni.Text <> '' then
    dtmRelCentralAP.qryRelaProtocolo.ParamByName('DATAINI').AsDate := DTpDataIni.Date;
  if DTpDataFin.Text <> '' then
    dtmRelCentralAP.qryRelaProtocolo.ParamByName('DATAFIN').AsDate := DTpDataFin.Date;

  dtmRelCentralAP.qryRelaProtocolo.Open;
end;

end.
