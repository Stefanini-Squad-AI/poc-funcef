unit FParamRelDepenMaioridade;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, Mask, wwdbedit, Wwdbspin;

type
  TfrmParamRelDepenMaioridade = class(TfrmOkCancelar)
    Patrocinadora: TLabel;
    dblcpatro: TCMDBLookupCombo;
    label1: TLabel;
    dblcSituacao: TCMDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    qrypatro: TwwQuery;
    qrySituacao: TwwQuery;
    qryGrauDepen: TwwQuery;
    dblcGrauDepen: TCMDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure Fazqry;
  public
    { Public declarations }
  end;

var
  frmParamRelDepenMaioridade: TfrmParamRelDepenMaioridade;

implementation

{$R *.DFM}

uses dRelAssistencial, USistema, UMensErro, FAguarde;

procedure TfrmParamRelDepenMaioridade.FormCreate(Sender: TObject);
begin
  inherited;
  qrypatro.Open;
  qrySituacao.Open;
  qryGrauDepen.Open;
  dblcpatro.Text := 'SERPROS';
  dblcpatro.LookupValue := '1';
  dblcSituacao.Text := 'Ativo';
  dblcSituacao.LookupValue := 'AT';
  dblcGrauDepen.Text := 'Filho';
  dblcGrauDepen.LookupValue := 'FIL';
end;

procedure TfrmParamRelDepenMaioridade.Fazqry;
var vSQL : string;
begin
  (* Exibe o frmAguarde mostrando a mensagem abaixo para o usuário *)
  frmAguarde.Mostra('Aguarde.  Montando relatório...');
  (* Adiciona ao SQL a query a ser executada *)
  vSQL :=        ' SELECT /*+ INDEX (PARTPREVPLAN SYS_C006299)*/'   +
                 '   DISTINCT'                                      +
                 '       PJ.NOME AS PATROCINADORA,'                 +
                 '       UPPER(PT.NOME) AS TITULAR,'                +
                 '      PPP.INSCRICAONUMERO AS INSCRICAO,'          +
                 '       UPPER(PD.NOME) AS DEPENDENTE,'             +
                 '       DT.IDDEPENDENCIA,'                         +
                 '       PF.DATANASC,'                              +
                 '   IDADES.GRUPO,'                                 +
                 '   TRUNC((SYSDATE - PF.DATANASC)/365.5) AS IDADE,'  +
                 '   ST.FLGINTERNO'                                 +
                 ' FROM'                                            +
                 '   PESSOA PT,'                                    +
                 '   PESSOA PJ,'                                    +
                 '   PESSOA PD,'                                    +
                 '   PESSOAFISICA PF,'                              +
                 '   PARTPREVPLAN PPP,'                             +
                 '   DEPENTIT DT,'                                  +
                 '   BENEFASS B,'                                   +
                 '   PARTASS PA,'                                   +
                 '   SITPART ST,'                                   +
                 '   (SELECT 21 AS IDADEMIN, 24 AS IDADEMAX, '+chr(39)+ 'G1' +chr(39)+ ' AS GRUPO FROM DUAL UNION ' +
                 '    SELECT 25 AS IDADEMIN, 99 AS IDADEMAX, '+chr(39)+ 'G2' +chr(39)+ ' AS GRUPO FROM DUAL  ) IDADES' +
                 ' WHERE';
  (* Filtro por patrocinadora *)
  if Trim(dblcpatro.Text) <> '' then
    vSQL := vSQL+'   (  PA.IDPESSJUR     = ' + dblcpatro.LookupValue + ') AND';
  (* Filtro por Situação *)
  if Trim(dblcSituacao.Text) <> '' then
    vSQL := vSQL+'   (  ST.FLGINTERNO    = ' +chr(39)+ dblcSituacao.LookupValue  +chr(39)+ ') AND';
  (* Filtro por Grau de Dependência *)
  if Trim(dblcGrauDepen.Text) <> '' then
    vSQL := vSQL+'   (  DT.IDDEPENDENCIA = ' +chr(39)+ dblcGrauDepen.LookupValue +chr(39)+ ') AND';
  vSQL := vSQL + '   (  PA.IDPESSOA      = PPP.IDPESSOA)    AND'                  +
                 '   (  PA.IDPESSJUR     = PPP.IDPESSJUR)   AND'                  +
                 '   (  PA.IDPLANOPREV   = PPP.IDPLANOPREV) AND'                  +
                 '   (  PA.SEQPROPOSTA   = PPP.SEQPROPOSTA) AND'                  +
                 '   (  PA.IDPESSOA      =  PT.IDPESSOA)    AND'                  +
                 '   (  PA.IDPESSJUR     =  PJ.IDPESSOA)    AND'                  +
                 '   (  PA.IDPESSOA      =  DT.IDTITULAR)   AND'                  +
                 '   (  DT.IDPESSOA      =  PD.IDPESSOA)    AND'                  +
                 '   (  PD.IDPESSOA      =  PF.IDPESSOA)    AND'                  +
                 '   ( PPP.IDSITPART     =  ST.IDSITPART)   AND'                  +
                 '   (  PA.IDPESSOA      = B.IDTITULAR)     AND'                  +
                 '   (  PA.IDPESSJUR     = B.IDPESSJUR)     AND'                  +
                 '   (  PA.IDPLANOPREV   = B.IDPLANOPREV)   AND'                  +
                 '   (  PA.SEQPROPOSTA   = B.SEQPROPOSTA)   AND'                  +
                 '   (  DT.IDTITULAR     = B.IDTITULAR)     AND'                  +
                 '   (  DT.IDPESSOA      = B.IDDEPENDENTE)  AND'                  +
                 '   (TRUNC((SYSDATE - PF.DATANASC)/365.5) >= IDADES.IDADEMIN) AND' +
                 '   (TRUNC((SYSDATE - PF.DATANASC)/365.5) <= IDADES.IDADEMAX)'     +
                 ' ORDER BY IDADES.GRUPO, PF.DATANASC DESC';
  dtmRelAssistencial.qryRelDepenMaioridade.Close;
  dtmRelAssistencial.qryRelDepenMaioridade.SQL.Clear;
  dtmRelAssistencial.qryRelDepenMaioridade.SQL.Add(vSQL);
  dtmRelAssistencial.qryRelDepenMaioridade.Open;
  if dtmRelAssistencial.qryRelDepenMaioridade.IsEmpty then frmAguarde.Apaga;
end;

procedure TfrmParamRelDepenMaioridade.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  (* atribui o escolhido pelo usuário a property GrauDependencia da unit dRelAssistencial
     que será usada no evento onPrint do label de Dependência do referido Relatório *)
  dtmRelAssistencial.GrauDependencia := dblcGrauDepen.Text;
  (* Procedure que monta a Query para o relatório *)
  fazqry;
end;

procedure TfrmParamRelDepenMaioridade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrypatro.Close;
  qrySituacao.Close;
  qryGrauDepen.Close;
end;

procedure TfrmParamRelDepenMaioridade.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dblcpatro.Text := 'SERPROS';
  dblcpatro.LookupValue := '1';
  dblcSituacao.Text := 'Ativo';
  dblcSituacao.LookupValue := 'AT';
  dblcGrauDepen.Text := 'Filho';
  dblcGrauDepen.LookupValue := 'FIL';
end;

end.
