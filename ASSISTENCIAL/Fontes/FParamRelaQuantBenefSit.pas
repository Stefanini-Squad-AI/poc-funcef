unit FParamRelaQuantBenefSit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, DBCtrls,
  CMDBLookupCombo, Mask, wwdbedit, Wwdbspin;

type
  TfrmParamRelaQuantBenefSit = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    dbseano: TwwDBSpinEdit;
    Label1: TLabel;
    dblcpatro: TCMDBLookupCombo;
    Label2: TLabel;
    dblcproduto: TCMDBLookupCombo;
    qryproduto: TwwQuery;
    qrypatro: TwwQuery;
    CbMes: TComboBox;
    qrypatroIDPESSOA: TFloatField;
    qrypatroNOME: TStringField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Fazqry;
  public
    { Public declarations }
  end;

var
  frmParamRelaQuantBenefSit: TfrmParamRelaQuantBenefSit;
   wDia,wMes,wAno : Word;
implementation

{$R *.DFM}

uses dRelAssistencial, usistema, uMensErro;

procedure TfrmParamRelaQuantBenefSit.Fazqry;
Var
  wMes:String;
begin
     DtmRelAssistencial.lbmes.Caption  := cbmes.Text+'/'+dbseano.Text;
     with dtmRelAssistencial.qryRelaQuantBenefSit do
     begin
          close;
          sql.clear;

          sql.add('SELECT PA.NOME AS PLANOASSISTENCIAL,');
          sql.add(       'PJ.NOME AS PATROCINADORA,');
          sql.add(       'SP.DESCRICAO AS SITUACAO,');
	  sql.add(       'COUNT(*) AS NUMBENEF ');
	  sql.add(  'FROM BENEFASS BA, PARTPREVPLAN PP,');
          sql.add(       'SITPART SP, PESSOA PJ, PLANASS PA ');
          sql.add( 'WHERE (PP.IDPESSJUR = BA.IDPESSJUR) ');
          sql.add(   'AND (PP.IDPLANOPREV = BA.IDPLANOPREV) ');
          sql.add(   'AND (PP.IDPESSOA = BA.IDTITULAR) ');
          sql.add(   'AND (PP.SEQPROPOSTA = BA.SEQPROPOSTA) ');
          sql.add(   'AND (SP.IDSITPART = PP.IDSITPART) ');
          sql.add(   'AND (PJ.IDPESSOA = BA.IDPESSJUR) ');
          sql.add(   'AND (PA.IDPLANASS = BA.IDPLANASS) ');

         If CbMes.ItemIndex < 10 Then
           wMes := dbseano.Text+'/0'+IntToStr(CbMes.ItemIndex+1)
         Else
           wMes := dbseano.Text+'/'+IntToStr(CbMes.ItemIndex+1);
         if wMes <>'' then
         begin
           // sql.add('AND (SP.FLGINTERNO <> ''CA'') ');
              sql.add('AND ((BA.DTCANCELAMENTO IS NULL) OR ');
              sql.add(     '(BA.DTCANCELAMENTO > ');
              sql.add(       'LAST_DAY(TO_DATE('''+wMes+''',''YYYY/MM'')))) ');
             end;
         if trim(dblcpatro.text) <>'' then
             sql.add('And (PJ.IDPESSOA = '+dblcpatro.lookupvalue+') ');

         if trim(dblcproduto.text) <>'' then
             sql.add('And (PA.IDPLANASS = '+dblcproduto.lookupvalue+') ');

          sql.add('GROUP BY PA.NOME,PJ.NOME,SP.DESCRICAO ');
          sql.add('ORDER BY PA.NOME,PJ.NOME,SP.DESCRICAO');

          open;
     end;
end;

procedure TfrmParamRelaQuantBenefSit.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
// Criticar Dados
  If CbMes.ItemIndex = -1 Then
     Begin
       MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
       cbMes.SetFocus;   
     End
  Else
     Fazqry;
end;

procedure TfrmParamRelaQuantBenefSit.FormShow(Sender: TObject);
begin
  inherited;
  qrypatro.open;
  qryproduto.open;
  // Mes e Ano Atual
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;
end;

procedure TfrmParamRelaQuantBenefSit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrypatro.Close;
  qryproduto.Close;
end;

procedure TfrmParamRelaQuantBenefSit.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  cbMes.SetFocus;
  dbseAno.Value := wAno;
  dblcpatro.LookupValue:='';
  dblcproduto.LookupValue:='';
end;

end.
