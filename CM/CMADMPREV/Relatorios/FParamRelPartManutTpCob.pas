unit FParamRelPartManutTpCob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Mask,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97;

type
  TfrmParamRelPartManutTpCob = class(TfrmOkCancelar)
    Label1: TLabel;
    Label2: TLabel;
    edMesRef: TMaskEdit;
    bdlckcmbPatro: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    rgTpCobra: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelPartManutTpCob: TfrmParamRelPartManutTpCob;

implementation

uses DRelatAdmPrev, UMensErro, UAdmPrev, fAguarde;

{$R *.DFM}

procedure TfrmParamRelPartManutTpCob.bbtnConfirmarClick(Sender: TObject);
var sSql  : string;
    iItem : Byte;
begin
  if edMesRef.Text = '' then
  begin
     MsgDlg('Selecione o Mês de Referência.','Erro',mtError,[mbOk,mbHelp],0);
     edMesRef.SetFocus;
     Exit;
  end;

  if bdlckcmbPatro.Text = '' then
  begin
     MsgDlg('Selecione a Patrocinadora.','Erro',mtError,[mbOk,mbHelp],0);
     bdlckcmbPatro.SetFocus;
     Exit;
  end;

  if rgTpCobra.ItemIndex = -1 then
  begin
     MsgDlg('Selecione o tipo de Cobrança.','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  try
    StrToDate('01/'+Copy(edMesRef.Text,6,2)+'/'+Copy(edMesRef.Text,1,4))
  except
     MsgDlg('Mês de Referência Inválido. Informe "AAAA/MM" !','Erro',mtError,[mbOk,mbHelp],0);
     edMesRef.SetFocus;
     Exit;
  end;

  inherited;

  with dtmRelatAdmPrev do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     iItem := rgTpCobra.ItemIndex;

     case iItem of
     0 : begin
         sSql := 'SELECT DISTINCT  REG.NOME AS NOMEREG,  PES.NOME AS NOMEPES, '+
                 '        EL.MATRICULA,  1 AS TOTPART,   To_Date(NULL,''dd/mm/yyyy'') AS DATAINICIOFUND, '+
                 '        H.IDPESSJUR,     H.IDPESSOA,   H.IDPLANOPREV,  H.SEQPROPOSTA, '+
                 '        H.MESREFERENCIA, H.IDMOTIVO     '+
                 ' FROM   PESSOA        REG,              '+
                 '        PESSOA        PES,              '+
                 '        ELEGPATRO     EL,               '+
                 '        CONTPREV      CP,               '+
                 '        HSTCONTRIBPREV   H              '+
                 ' WHERE  (EL.IDPESSJUR  = :IDPESSJUR)    '+
                 ' AND    (EL.IDESTAB    = REG.IDPESSOA)  '+
                 ' AND    (EL.IDPESSOA   = PES.IDPESSOA)  '+
                 ' AND    (H.MESREFERENCIA   <  :MESREF)  '+
                 ' AND    (H.MESCOBRANCA     =  :MESREF)  '+
                 ' AND    (H.IDPESSJUR             = EL.IDPESSJUR) '+
                 ' AND    (H.IDPESSOA              = EL.IDPESSOA) '+
                 ' AND    (H.IDPLANOPREV      = CP.IDPLANOPREV)  '+
                 ' AND    (H.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO) '+
                 ' AND    (CP.FLGNAOEXIGEREC  = 1 )                '+
                 ' ORDER BY PES.NOME                               ';
         end;
     1 : begin
         sSql := 'SELECT DISTINCT  REG.NOME AS NOMEREG,  PES.NOME AS NOMEPES, '+
                 '        EL.MATRICULA,  1 AS TOTPART,   To_Date(NULL,''dd/mm/yyyy'') AS DATAINICIOFUND, '+
                 '        H.IDPESSJUR,     H.IDPESSOA,   H.IDPLANOPREV,  H.SEQPROPOSTA, '+
                 '        H.MESREFERENCIA, H.IDMOTIVO      '+
                 ' FROM   PESSOA        REG,               '+
                 '        PESSOA        PES,               '+
                 '        ELEGPATRO     EL,                '+
                 '        CONTPREV      CP,                '+
                 '        HSTCONTRIBPREV   H               '+
                 ' WHERE  (EL.IDPESSJUR = :IDPESSJUR)      '+
                 ' AND    (EL.IDESTAB      = REG.IDPESSOA) '+
                 ' AND    (EL.IDPESSOA   = PES.IDPESSOA)   '+
                 ' AND    (H.MESREFERENCIA   =  :MESREF)   '+
                 ' AND    (H.IDPESSJUR             = EL.IDPESSJUR) '+
                 ' AND    (H.IDPESSOA              = EL.IDPESSOA) '+
                 ' AND    (H.IDPLANOPREV      = CP.IDPLANOPREV)  '+
                 ' AND    (H.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO) '+
                 ' AND    (CP.FLGNAOEXIGEREC  = 1 )                '+
                 ' ORDER BY PES.NOME                               ';
         end;
     2 : begin
         sSql := ' SELECT DISTINCT REG.NOME AS NOMEREG,  PES.NOME AS NOMEPES,     '+
                 ' EL.MATRICULA,     1 AS TOTPART,    BF.DATAINICIOFUND,          '+
                 ' H.IDPESSJUR,      H.IDPESSOA,      H.IDPLANOPREV,              '+
                 ' H.SEQPROPOSTA,    H.MESREFERENCIA, H.IDMOTIVO                  '+
                 ' FROM   PESSOA         REG,                                     '+
                 ' PESSOA         PES,                                            '+
                 ' PESSOAFISICA   PF,                                             '+
                 ' ELEGPATRO      EL,                                             '+
                 ' CONTPREV       CP,                                             '+
                 ' BENEFBFCIARIO  BF,                                             '+
                 ' HSTCONTRIBPREV  H                                              '+
                 ' WHERE  (EL.IDPESSJUR  = :IDPESSJUR)                            '+
                 ' AND    (EL.IDESTAB    = REG.IDPESSOA)                          '+
                 ' AND    (EL.IDPESSOA   = PES.IDPESSOA)                          '+
                 ' AND    (EL.IDPESSOA   = PF.IDPESSOA)                           '+
                 ' AND    (H.MESREFERENCIA    = :MESREF)                          '+
                 ' AND    (H.IDPESSJUR        = EL.IDPESSJUR)                     '+
                 ' AND    (H.IDPESSOA         = EL.IDPESSOA)                      '+
                 ' AND    (H.IDPLANOPREV      = CP.IDPLANOPREV)                   '+
                 ' AND    (H.IDCONTRIBUICAO   = CP.IDCONTRIBUICAO)                '+
                 ' AND    (CP.FLGNAOEXIGEREC  = 1 )                               '+
                 ' AND    (H.IDPESSJUR   = BF.IDPESSJUR(+) )                      '+
                 ' AND    (H.IDPLANOPREV = BF.IDPLANOPREV(+) )                    '+
                 ' AND    (H.IDPESSOA    = BF.IDPESSOA(+) )                       '+
                 ' AND    (H.SEQPROPOSTA = BF.SEQPROPOSTA(+) )                    '+
                 ' AND (  (TO_CHAR(BF.DATAINICIOFUND,''YYYY/MM'') = H.MESREFERENCIA) OR '+
                 ' (TO_CHAR(PF.DATAMORTE,''YYYY/MM'') = H.MESREFERENCIA)  )             '+
                 ' ORDER BY PES.NOME                                                    ';
         end;
     end;

     qryPaPdvTpCob.Close;
     qryPaPdvTpCob.Sql.Clear;
     qryPaPdvTpCob.Sql.Add(sSql);
     qryPaPdvTpCob.ParamByName('IDPESSJUR').AsInteger := qryPatro.FieldByName('IDPESSOA').AsInteger;
     qryPaPdvTpCob.ParamByName('MESREF').AsString     := edMesRef.Text;

     frmAguarde.Mostra('Processando consulta...');
     qryPaPdvTpCob.Open;
     if qryPaPdvTpCob.IsEmpty
     then MsgDlg('Nenhum registro encontrado !!','Atenção',mtWarning,[mbOk,mbHelp],0);

     dtmRelatAdmPrev.rpPaPdvTpCoblblTpCobra2.Caption := rgTpCobra.Items[rgTpCobra.ItemIndex];
     dtmRelatAdmPrev.rpPaPdvTpCoblblMesRef.Caption   := edMesRef.Text;

     frmAguarde.Apaga;
  end;
end;

procedure TfrmParamRelPartManutTpCob.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;  qryPatro.Open;

  dtmRelatAdmPrev.qryPaPdvTpCob.ParamByName('IDPESSJUR').AsInteger := -1;
  dtmRelatAdmPrev.qryPaPdvTpCob.ParamByName('MESREF').AsString     := '';

  rgTpCobra.ItemIndex := 1;
end;

procedure TfrmParamRelPartManutTpCob.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  bdlckcmbPatro.Text := '';
  edMesRef.Text      := '';
end;

end.








