unit fParamRelGrauDependencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  CMDBLookupCombo, Mask, wwdbedit, Wwdbspin;

type
  TfrmParamRelGrauDependencia = class(TfrmOkCancelar)
    Patrocinadora: TLabel;
    dblcpatro: TCMDBLookupCombo;
    Label2: TLabel;
    qrypatro: TwwQuery;
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
  frmParamRelGrauDependencia: TfrmParamRelGrauDependencia;

implementation

{$R *.DFM}

uses dRelAssistencial, USistema, UMensErro, FAguarde;

procedure TfrmParamRelGrauDependencia.FormCreate(Sender: TObject);
begin
  inherited;
  qrypatro.Open;
  dblcpatro.Text := 'SERPROS';
  dblcpatro.LookupValue := '1';
end;

procedure TfrmParamRelGrauDependencia.Fazqry;
var vSQL : string;
begin
  (* Exibe o frmAguarde mostrando a mensagem abaixo para o usuário *)
  frmAguarde.Mostra('Aguarde.  Montando relatório...');
  (* Adiciona ao SQL a query a ser executada *)
  vSQL :=' SELECT /*+ INDEX (PARTPREVPLAN SYS_C006299)*/ '+
         '   DISTINCT'                          +
         '    PJ.NOME AS PATROCINADORA,'        +
         '   UPPER(PT.NOME) AS TITULAR,'        +
         '   PPP.INSCRICAONUMERO AS INSCRICAO,' +
         '   UPPER(PD.NOME) AS DEPENDENTE,'     +
         '     D.DESCRICAO AS GRAUDEPEN,'       +
         '    ST.DESCRICAO AS SITUACAO'         +
         ' FROM'                                +
         '   PESSOA PT,'                        +
         '   PESSOA PJ,'                        +
         '   PESSOA PD,'                        +
         '   PARTPREVPLAN PPP,'                 +
         '   DEPENTIT DT,'                      +
         '   BENEFASS B,'                       +
         '   PARTASS PA,'                       +
         '   DEPEN D,'                          +
         '   SITPART ST'                        +
         ' WHERE'                               +
         '   ( PA.IDPESSJUR     = 1)   AND'     +
         '   ((ST.FLGINTERNO    = ' +chr(39)+ 'AT'  +chr(39)+ ' ) OR (ST.IDSITPART = 13)) AND' +
         '   (  D.IDDEPENDENCIA <> '+chr(39)+ 'PRP' +chr(39)+ ' ) AND' +
         '   (  B.DTCANCELAMENTO IS NULL) AND'               +
         '  ((  B.IDPLANASS = 11) OR (B.IDPLANASS = 3)) AND' +
         '   ( PA.IDPESSOA      = PPP.IDPESSOA)         AND' +
         '   ( PA.IDPESSJUR     = PPP.IDPESSJUR)        AND' +
         '   ( PA.IDPLANOPREV   = PPP.IDPLANOPREV)      AND' +
         '   ( PA.SEQPROPOSTA   = PPP.SEQPROPOSTA)      AND' +
         '   ( PA.IDPESSOA      =   B.IDTITULAR)        AND' +
         '   ( PA.IDPESSJUR     =   B.IDPESSJUR)        AND' +
         '   ( PA.IDPLANOPREV   =   B.IDPLANOPREV)      AND' +
         '   ( PA.SEQPROPOSTA   =   B.SEQPROPOSTA)      AND' +
         '   ( DT.IDTITULAR     =   B.IDTITULAR)        AND' +
         '   ( DT.IDPESSOA      =   B.IDDEPENDENTE)     AND' +
         '   ( PA.IDPESSOA      =  PT.IDPESSOA)         AND' +
         '   ( PA.IDPESSJUR     =  PJ.IDPESSOA)         AND' +
         '   ( PA.IDPESSOA      =  DT.IDTITULAR)        AND' +
         '   ( DT.IDPESSOA      =  PD.IDPESSOA)         AND' +
         '   ( DT.IDDEPENDENCIA =   D.IDDEPENDENCIA)    AND' +
         '   (PPP.IDSITPART    =  ST.IDSITPART)';
  (*Filtro*)
  if Trim(dblcpatro.Text) <> '' then
    vSQL := vSQL+' AND (PA.IDPESSJUR = ' + dblcpatro.LookupValue + ') ';
  vSQL := vSQL+' ORDER BY TITULAR' ;
  dtmRelAssistencial.qryRelGrauDependencia.Close;
  dtmRelAssistencial.qryRelGrauDependencia.SQL.Clear;
  dtmRelAssistencial.qryRelGrauDependencia.SQL.Add(vSQL);
  dtmRelAssistencial.qryRelGrauDependencia.Open;
  if dtmRelAssistencial.qryRelGrauDependencia.IsEmpty then frmAguarde.Apaga;
end;

procedure TfrmParamRelGrauDependencia.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  (* Procedure que monta a Query para o relatório *)
  fazqry;
end;

procedure TfrmParamRelGrauDependencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrypatro.Close;
end;

procedure TfrmParamRelGrauDependencia.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  dblcpatro.Text := 'SERPROS';
  dblcpatro.LookupValue := '1';
end;

end.
