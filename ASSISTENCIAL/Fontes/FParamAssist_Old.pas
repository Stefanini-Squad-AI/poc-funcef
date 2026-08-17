unit FParamAssist_Old;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, ComCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit, wwdblook,
  TB97,FPrincipal,IvDictio, IvMulti, IvEMulti, TB97Tlbr;

type
  TfrmParamAssist = class(TfrmOkCancelar)
    qry: TwwQuery;
    ds: TwwDataSource;
    qryDescontos: TwwQuery;
    qryAux: TwwQuery;
    qryMotivo: TwwQuery;
    Label13: TLabel;
    qryRegra: TwwQuery;
    pgctrlParam: TPageControl;
    tbsGeral: TTabSheet;
    pnlGerais: TPanel;
    tbsMotivos: TTabSheet;
    pnlMotivos: TPanel;
    ScrollBox1: TScrollBox;
    Label10: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    cmbmotivocontribass: TwwDBLookupCombo;
    wwDBLookupCombo5: TwwDBLookupCombo;
    wwDBLookupCombo6: TwwDBLookupCombo;
    cmbmotivoatrasoas: TwwDBLookupCombo;
    cmbmotivodevolas: TwwDBLookupCombo;
    cmbmotivofinancas: TwwDBLookupCombo;
    Label1: TLabel;
    qryParamAssist: TwwQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    chFLGINTCONTBASS: TDBCheckBox;
    chFLGINTCPAGAR: TDBCheckBox;
    chFLGINTCRECEBER: TDBCheckBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ChPrePag: TCheckBox;
    qryCentroCusto: TwwQuery;
    qryPrograma: TwwQuery;
    Panel4: TPanel;
    pnlCentroCusto: TPanel;
    GroupBox8: TGroupBox;
    dblkPrograma: TwwDBLookupCombo;
    GroupBox12: TGroupBox;
    dblkCentroCusto: TwwDBLookupCombo;
    cbCalcula: TCheckBox;
    dsParamassist: TwwDataSource;
    GroupBox2: TGroupBox;
    chFLGCOBPRIMBCOASS: TDBCheckBox;
    qryTipoRegra: TwwQuery;
    qryGrupoRegra: TwwQuery;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure cbCalculaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamAssist: TfrmParamAssist;

implementation

uses DBaseDados, UAdmAss, UDataBase, UMensErro, USistema, UAutorizacao,
     UIntegraBack;

Type
   tipoMascara = set of char;
Const
   mascara : tipoMascara = ['9','.'];
   letra   : tipoMascara = ['A'..'z'];
   numero  : tipoMascara = ['0'..'9'];

{$R *.DFM}

procedure TfrmParamAssist.FormActivate(Sender: TObject);
Var sChave: String;
begin
  inherited;

  qryMotivo.Close;
  qryMotivo.Open;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add
  // FERNANDO - P. 16853 - INICIO
{
    ('SELECT IDMOTIVOCONTRIBA,IDMOTIVOATRASOAS,IDMOTIVODEVOLAS,'+
            'IDMOTIVOFINANCAS,IDMOTIVOFORNPAG,IDMOTIVOFORNCOMI,'+
            'FLGINTCONTBASS,FLGINTCPAGAR,FLGINTCRECEBER,'+
            'FLGCOBPRIMBCOASS, IDPESSOA'+
}
    ('SELECT FLGINTCONTBASS,FLGINTCPAGAR,FLGINTCRECEBER,'+
            'FLGCOBPRIMBCOASS, IDPESSOA'+
  // FERNANDO - P. 16853 - FIM
     ' FROM '+Sistema.PrefixoServidor+'PARAMAPREV');
  qry.Open;
  qry.Edit;
  qryDescontos.Close;
  qryDescontos.SQL.Clear;
  if (qry.IsEmpty) or (prmflgMultiFundacao) then
  begin
     qryDescontos.SQL.Add(' SELECT P.IDPROVENTO,P.DESCRICAO'+
                            ' FROM PROVDESC P'+
                           ' WHERE (P.FLGDESCONTO = 1)'+
                           ' ORDER BY UPPER(P.DESCRICAO)');
  end
  else
  begin // Monofundacao
     qryDescontos.SQL.Add(' SELECT P.IDPROVENTO,P.DESCRICAO'+
                            ' FROM PROVDESC P, RUBRICAXPESS R'+
                           ' WHERE (R.IDPESSOA = '+IntToStr(iIdFundacao)+') AND'+
                                 ' (P.FLGDESCONTO = 1) AND'+
                                 ' (R.IDRUBRICA = P.IDPROVENTO)'+
                           ' ORDER BY UPPER(P.DESCRICAO)');
  end;
  qryDescontos.Open;

  qryRegra.Close;
  qryRegra.Open;

  qryPrograma.Open;
  // FERNANDO - P. 15470 INICIO - 22/12/03
  qryCentroCusto.close;
  qryCentrocusto.parambyname('IEMPRESA').asInteger := iIdFundacao;
  qryCentroCusto.Open;
  // FERNANDO - P. 15470 FIM - 22/12/03  

  qryParamAssist.Open;

  dblkPrograma.LookupValue:='';
  dblkPrograma.Text:='';
  dblkCentroCusto.LookupValue:='';
  dblkCentroCusto.Text:='';

  If Not qryParamAssist.IsEmpty then
  begin
    chPrePag.Checked:=qryParamAssist.FieldByName('FlgPrePag').AsString='1';
    cbCalcula.Checked:=qryParamAssist.FieldByName('FlgUsaCentCust').AsString='1';
    sChave:=qryParamAssist.FieldByName('CODPROGRAMA').AsString ;
    If qryPrograma.Locate('CODPROGRAMA', sChave, [loCaseInsensitive]) then
    begin
      dblkPrograma.LookupValue:=qryPrograma.FieldByName('CODPROGRAMA').AsString;
      dblkPrograma.Text:=qryPrograma.FieldByName('DESCPROGRAMA').AsString;
    end;
    sChave:=qryParamAssist.FieldByName('CODCENTROCUSTO').AsString ;
    If qryCentroCusto.Locate('CODCENTROCUSTO', sChave, [loCaseInsensitive]) then
    begin
      dblkCentroCusto.LookupValue:=qryCentroCusto.FieldByName('CODCENTROCUSTO').AsString;
      dblkCentroCusto.Text:=qryCentroCusto.FieldByName('NOME').AsString;
    end;
  end;
//  qryParamAssist.Close;   - p. 16853
  qryParamAssist.edit; // - p. 16853
  pgctrlParam.ActivePage := tbsGeral;
end;

procedure TfrmParamAssist.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  { Atualizar  as variaveis-parametro }
  LeParam(dtmBaseDados.dbBaseDados.DatabaseName, False);
end;

procedure TfrmParamAssist.bbtnConfirmarClick(Sender: TObject);
var i, j : Integer;
    AMotivos : Array[1..4] of Integer;
    bRepetiu : boolean;
    sFlagP   : Char;
    sLinUpdate: String;

begin
  inherited;

  // FERNANDO - P. 16853 - INICIO
{
  AMotivos[1] := qry.fieldbyname('IDMOTIVOCONTRIBA').AsInteger;
  AMotivos[2] := qry.fieldbyname('idmotivoatrasoas').AsInteger;
  AMotivos[3] := qry.fieldbyname('idmotivodevolas').AsInteger;
  AMotivos[4] := qry.fieldbyname('idmotivofinancas').AsInteger;
}
  AMotivos[1] := qryParamAssist.fieldbyname('IDMOTIVOCONTRIBA').AsInteger;
  AMotivos[2] := qryParamAssist.fieldbyname('idmotivoatrasoas').AsInteger;
  AMotivos[3] := qryParamAssist.fieldbyname('idmotivodevolas').AsInteger;
  AMotivos[4] := qryParamAssist.fieldbyname('idmotivofinancas').AsInteger;

  // FERNANDO - P. 16853 - FIM

  //verifica se os motivos do módulo assistencial
  //estão repetidos
  bRepetiu := false;
  for i := 1 to 3 do
     for j := i+1 to 4 do
        if (AMotivos[i] > 0) and (AMotivos[j] > 0)
            and (AMotivos[i] = AMotivos[j]) then
          bRepetiu := true;

  if bRepetiu then
  begin
     MsgDlg('Os Motivos devem ser diferentes.', 'Erro', mtError, [mbOk], 0);
     exit;
  end;

  idMotivoCalcAs   := AMotivos[1];
  idMotivoAtrasoAs := AMotivos[2];
  idMotivoDevolAs  := AMotivos[3];
  idMotivoFinancAs := AMotivos[4];

  if chFLGINTCONTBASS.Checked then
    IntegraBack.Contabilidade := 'S'
  else
    IntegraBack.Contabilidade := 'N';

  if chFLGINTCPAGAR.Checked or chFLGINTCRECEBER.Checked then
    IntegraBack.Financeiro := 'S'
  else
    IntegraBack.Financeiro := 'N';

  qry.Post;
  qry.Close;

  qryparamassist.post;   // fernando - p. 16853
  qryParamassist.close;  // fernando - p. 16853

  (* Atualiza Flag de Pré-pagamento - 0 = Não utiliza pré pagamento. *)
  (*                                  1 = Utiliza.                   *)
  If chPrePag.Checked then sFlagP:='1' else sFlagP:='0';

  sLinUpdate:='FLGPREPAG = '+QuotedStr(sFlagP);

  (* Contas a pagar - Cálculo de CPMF *)
  If cbCalcula.Checked then
    sLinUpdate:=sLinUpdate+',FLGUSACENTCUST = ''1'''+
     ',CODPROGRAMA = '+QuotedStr(dblkPrograma.LookupValue)+
     ',CODCENTROCUSTO = '+QuotedStr(dblkCentroCusto.LookupValue)
  else sLinUpdate:=sLinUpdate+',FLGUSACENTCUST = ''0'',CODPROGRAMA = NULL,'+
                              'CODCENTROCUSTO = NULL';
  (* ================================ *)

  If not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('UPDATE PARAMASSIST SET '+sLinUpdate);
  Try
    qryAux.ExecSQL;
    dtmBaseDados.dbBaseDados.Commit;
  Except
    dtmBaseDados.dbBaseDados.Rollback;
    MsgDlg('Parametro do sistema não atualizado corretamente.', 'Erro', mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TfrmParamAssist.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qry.Cancel;
  qry.Close;
  Close;
end;

procedure TfrmParamAssist.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Acrescentar IdPessoa da Rubrica, que é o Id da Empresa do Login
  qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
end;

procedure TfrmParamAssist.cbCalculaClick(Sender: TObject);
begin
  inherited;
  pnlCentroCusto.Enabled:=cbCalcula.Checked;
end;

end.
