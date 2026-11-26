{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FParamRelaEntSaiFolha;

interface

uses
  Windows    , Messages, SysUtils, Classes        , Graphics, Controls, Forms   ,
  FOkCancelar, StdCtrls, wwdblook, CMDBLookupCombo, IvDictio, IvMulti , Dialogs ,
  IvEMulti   , MAHlpBtn, Buttons , TB97Tlbr       , TB97    , ExtCtrls, checklst,
  wwdbedit   , Wwdbspin, Db      , DBTables       , Wwquery , ComCtrls, Mask ,
  DBCtrls, MontaSelect, Wwdatsrc, usistema, dbasedados;
type
  TfrmParamRelaEntSaiFolha = class(TfrmOkCancelar)
    grpMesRef       : TGroupBox;
    cbMes           : TComboBox;
    dbseAno         : TwwDBSpinEdit;
    cmbPatrocinadora: TwwDBLookupCombo;
    cmbPlano: TwwDBLookupCombo;
    cmbBeneficio: TwwDBLookupCombo;
    QryPatrocinadora: TwwQuery;
    dsPatrocinadora: TwwDataSource;
    qryPlano: TwwQuery;
    dsPlano: TwwDataSource;
    QryBeneficio: TwwQuery;
    dsBeneficio: TwwDataSource;
    Patrocinadora: TLabel;
    Plano: TLabel;
    Beneficio: TLabel;
    Bevel1: TBevel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  
  public
    { Public declarations }
  end;
  Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
            Lista: TStringList; Chave, Descricao:String);

var
  frmParamRelaEntSaiFolha         : TfrmParamRelaEntSaiFolha;
  i                               : Integer;
  LstPatro, LstPlano, LstBeneficio: TStringList;
  SPatro  , SPlan   , SBenef      : String;
  wDia    , wMes    , wAno        : Word;

implementation

uses UMensErro, dRelFolha, uAdmPrevFB, drelentsaifolha;

{$R *.DFM}

procedure TfrmParamRelaEntSaiFolha.bbtnConfirmarClick(Sender: TObject);
 var
  mes1,ano1          : string;
  mes2,ano2          : string;
  MES_ATUAL,MES_ANT  : string;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Criticar Dados
  if cbMes.ItemIndex = -1 then
    begin
     MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cbMes.SetFocus;
      MODALRESULT := MRNONE;
     Exit;
    end
  else if  dbseAno.Value = 0 then
    begin
     MsgDlg('Ano de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     dbseAno.Value := wAno;
     dbseano.SetFocus;
     MODALRESULT := MRNONE;
     Exit;
    end ;
      ano1 := dbseano.Text;
      ano2 := dbseano.Text;
    If cbmes.ItemIndex < 9 Then mes1 := '0'+inttostr(cbmes.ItemIndex+1)
      Else mes1 := inttostr(cbmes.ItemIndex+1);
    If (cbmes.ItemIndex < 10) and (cbmes.ItemIndex > 0)
                    Then mes2 := '0'+inttostr(cbmes.ItemIndex);
    If (cbmes.ItemIndex > 9 ) Then mes2 := inttostr(cbmes.ItemIndex);
    If cbmes.ItemIndex = 0 Then
    begin
      mes2 := '12' ;
      ano2 := inttostr((strtoint(ano2) - 1));
    end;
    MES_ATUAL := ano1+'/'+mes1;
    MES_ANT := ano2+'/'+mes2;
   with dtmrelfolha do
       begin
         // OBTER DADOS DA FUNDAÇÃO
         qryFundacao.Close;
         qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
         qryFundacao.Prepare;
         qryFundacao.Open;
       end;
  with dtmrelentsaifolha.qryENTRADA do
  begin
    Close;
    SQL.Clear;
    SQL.Add(
   'SELECT                                '+
	'DISTINCT P.NOME BENEFICIOARIO,   '+
	'B.NOME BENEFICIO,                '+
        'DECODE(BP.FLGCALCTODOMES,0,ATUAL.VALORPREV,1,ATUAL.VALORPREV*C.COTVALOR,'+
        'NULL,ATUAL.VALORPREV )AS VALOR,  '+
        ' ATUAL.MES                       '+
        '  FROM                           '+
	'HSTBENEFBFCIARIO ATUAL,          '+
        'PESSOA P,                        '+
        'BENEFICIO B,                     '+
        'BENEFPLANPREV BP,                '+
        'COTACAOMOEDA C ,                 '+
        'PLANPREV   PL                    '+
'WHERE                                    '+
   'ATUAL.IDPESSOA NOT IN (SELECT IDPESSOA FROM HSTBENEFBFCIARIO '+
   'WHERE MES =  '+QuotedStr(MES_ANT)+') ');
  // Se for escolhida uma Patrocinadora ...
    If (cmbPatrocinadora.Text <> '') Then
      SQL.Add(' AND   ATUAL.IDPESSJUR = '+cmbPatrocinadora.LookupValue+' ');
    // Se for escolhido um Plano ...
    If (cmbPlano.Text <> '') Then
      SQL.Add(' AND   ATUAL.IDPLANOPREV = '+cmbPlano.LookupValue+' ');
    // Se for escolhido um Benefício ...
    If (cmbBeneficio.Text <> '') Then
      SQL.Add(' AND   ATUAL.IDBENEFICIO = '+cmbBeneficio.LookupValue+' ');
  SQL.Add(
'     AND ATUAL.MES = '''+MES_ATUAL+'''                 '+
'     AND P.IDPESSOA = ATUAL.IDPESSOA                   '+
'     AND B.IDBENEFICIO = ATUAL.IDBENEFICIO             '+
'     AND BP.IDPLANOPREV = ATUAL.IDPLANOPREV            '+
'     AND BP.IDBENEFICIO = ATUAL.IDBENEFICIO            '+
'     AND C.MOECODIGO(+) = BP.INDICEREAJBENEF           '+
'     AND C.COTDATA(+)   = TO_DATE('''+MES_ATUAL+''','+'''YYYY/MM'''+')'+' '+
'     AND PL.IDPLANOPREV = ATUAL.IDPLANOPREV            ');
    SQL.Add(' ORDER BY B.NOME');

  end;
   with dtmrelentsaifolha.qrySAIDA do
  begin
   Close;
    SQL.Clear;
    SQL.Add(
   'SELECT                                '+
	 'DISTINCT P.NOME BENEFICIOARIO,   '+
	 'B.NOME BENEFICIO,                '+
        'DECODE(BP.FLGCALCTODOMES,0,ANT.VALORPREV,1,ANT.VALORPREV*C.COTVALOR,'+
        'NULL,ANT.VALORPREV )AS VALOR,    '+
        ' ANT.MES                       '+
        '  FROM                           '+
	 'HSTBENEFBFCIARIO ANT,            '+
        'PESSOA P,                        '+
        'BENEFICIO B,                     '+
        'BENEFPLANPREV BP,                '+
        'COTACAOMOEDA C ,                 '+
        'PLANPREV   PL                    '+
'WHERE                                    '+
'ANT.IDPESSOA NOT IN (SELECT IDPESSOA FROM HSTBENEFBFCIARIO '+
'WHERE MES = '+QuotedStr(MES_ATUAL)+')     '+
  'AND ANT.MES = '''+MES_ANT+'''       '+
  'AND P.IDPESSOA = ANT.IDPESSOA        '+
  'AND B.IDBENEFICIO = ANT.IDBENEFICIO  '+
  'AND BP.IDPLANOPREV = ANT.IDPLANOPREV '+
  'AND BP.IDBENEFICIO = ANT.IDBENEFICIO '+
  'AND C.MOECODIGO(+) = BP.INDICEREAJBENEF '+
  'AND C.COTDATA(+)   = TO_DATE('''+MES_ATUAL+''','+'''YYYY/MM'''+')'+' '+
  'AND PL.IDPLANOPREV = ANT.IDPLANOPREV ');
  // Se for escolhida uma Patrocinadora ...
    If (cmbPatrocinadora.Text <> '') Then SQL.Add(' AND   ANT.IDPESSOA = '+cmbPatrocinadora.LookupValue+' ');
    // Se for escolhido um Plano ...
    If (cmbPlano.Text <> '') Then SQL.Add(' AND   ANT.IDPLANOPREV = '+cmbPlano.LookupValue+' ');
    // Se for escolhido um Benefício ...
    If (cmbBeneficio.Text <> '') Then SQL.Add(' AND   ANT.IDBENEFICIO = '+cmbBeneficio.LookupValue+' ');

    SQL.Add(' ORDER BY B.NOME');

  end;
end;


Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
			   Lista: TStringList; Chave, Descricao:String);
Begin

End;

procedure TfrmParamRelaEntSaiFolha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatrocinadora.Open;
  qryPlano.Open;
  qrybeneficio.Open;
  Action := caFree;
end;

procedure TfrmParamRelaEntSaiFolha.FormCreate(Sender: TObject);
begin
  inherited;
  // Ano e Mês
  qryPatrocinadora.Open;
  qryPlano.Open;
  qrybeneficio.Open;
end;

procedure TfrmParamRelaEntSaiFolha.FormShow(Sender: TObject);
var year, month, day : Word;
begin
   // Atualiza as Querys
   decodedate(date,year,month,day);

   cbmes.itemindex := month-1;
   dbseano.Value   := Year;
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/01/2002 A 29/01/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

