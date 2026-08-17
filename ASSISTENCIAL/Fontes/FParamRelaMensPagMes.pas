unit FParamRelaMensPagMes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, DBCtrls,
  CMDBLookupCombo, Mask, wwdbedit, Wwdbspin;

type
  TfrmParamRelaMensPagMes = class(TfrmOkCancelar)
    qrymes: TwwQuery;
    GroupBox1: TGroupBox;
    dbseano: TwwDBSpinEdit;
    Label1: TLabel;
    dblcpatro: TCMDBLookupCombo;
    Label2: TLabel;
    dblcfilial: TCMDBLookupCombo;
    qryfilial: TwwQuery;
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
  frmParamRelaMensPagMes: TfrmParamRelaMensPagMes;
  wDia,wMes,wAno : Word;

implementation

{$R *.DFM}

uses dRelAssistencial, usistema, UMensErro;

procedure TfrmParamRelaMensPagMes.Fazqry;
var
  wMes:String;
begin
     with dtmRelAssistencial.qryRelaMensPagMes do
     begin
          close;
          sql.clear;
          sql.add(' SELECT                                              ');
          sql.add('    TD.INSCRICAONUMERO AS INSCRICAO,                 ');
          sql.add('    TD.MESREFERENCIA AS REFERENCIA,                  ');
          sql.add('    TD.MATRICULA AS MATRICULA,                       ');
	  sql.add('    P.NOME, TD.CODPROVDESC AS RUBRICA,               ');
	  sql.add('    TD.VALOR AS VALORCMD,   PJ.NOME AS PATROCINADORA,');
	  sql.add('    TD.VALORRECEBIDO AS VALORREC,                    ');
          sql.add('    FL.DESCFILIAL AS FILIAL,                         ');
	  sql.add('    (TD.VALOR - TD.VALORRECEBIDO) AS DIFERENCA       ');

          sql.add(' FROM TMPDESC TD, PESSOA P, ELEGPATRO EP, FILIAL FL, PESSOA PJ');

          sql.add(' WHERE                                       ');
          sql.add('        (TD.FLGTIPODESC  = ''A'')            ');
          sql.add('    AND (TD.FLGDESCFOLHA IN (''P'',''B''))   ');
          sql.add('    AND (TD.IDPESSJUR = EP.IDPESSJUR)        ');
          sql.add('    AND (TD.IDTITULAR = EP.IDPESSOA)         ');
          sql.add('    AND (TD.IDPESSJUR = PJ.IDPESSOA)         ');
          sql.add('    AND (EP.IDESTAB   = FL.IDFILIAL(+))      ');
          sql.add('    AND (TD.IDPESSOA  = P.IDPESSOA)          ');

         if CbMes.ItemIndex < 10 then
           wMes := dbseano.Text+'/0'+IntToStr(CbMes.ItemIndex+1)
         else
           wMes := dbseano.Text+'/'+IntToStr(CbMes.ItemIndex+1);
         if wMes <>'' then
             begin
               sql.add('    And ( TD.MESREFERENCIA = '''+wMes+''')');
             end;
         if trim(dblcpatro.text) <>'' then
             sql.add('    And (TD.IDPESSJUR = '+dblcpatro.lookupvalue+')');

         if trim(dblcfilial.text) <>'' then
             sql.add('    And (EP.IDESTAB = '+dblcfilial.lookupvalue+')');

          sql.add('ORDER BY TD.CODPROVDESC                             ');
//          sql.add(' ');
          open;
     end;
end;

procedure TfrmParamRelaMensPagMes.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
// Criticar Dados
  if CbMes.ItemIndex = -1 then
  begin
    MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
    cbMes.SetFocus;
  end
  else
    Fazqry;
end;

procedure TfrmParamRelaMensPagMes.FormShow(Sender: TObject);
begin
  inherited;

  qrymes.open;
  qrypatro.open;
  qryfilial.open;

  // Mes e Ano Atual
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value := wAno;
end;

procedure TfrmParamRelaMensPagMes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrymes.Close;
  qrypatro.Close;
  qryfilial.Close;
end;

procedure TfrmParamRelaMensPagMes.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  cbMes.SetFocus;
  dbseAno.Value := wAno;
  dblcpatro.LookupValue:='';
  dblcfilial.LookupValue:='';
end;

end.
