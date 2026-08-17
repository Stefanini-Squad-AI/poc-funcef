{===============================================================================
Unit    :  uOkEnquadraParticipante
Form    :  frmOkEnquadraParticipante

Autor   : Rômulo R Rebouças
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Enquadaramento de participantes para cálculo ou exportação de Cadastros

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uOkCriticaParticipante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, uEnquadraParticipante, comctrls,
  checklst;

type
  TfrmOkCriticaParticipante = class(TfrmOkCancelar)
    RadioGroupTipo: TRadioGroup;
    wwQryParticipante: TwwQuery;
    wwQryGrupoCritica: TwwQuery;
    FQuery: TwwQuery;
    qryCriaMapaTotal: TwwQuery;
    qryCriaMapaDemonst: TwwQuery;
    qryDelMapaTotal: TwwQuery;
    qryDelMapaDemonst: TwwQuery;
    qryInsMapaTotal: TwwQuery;
    qryInsMapaDemonst: TwwQuery;
    BdTemporario: TDatabase;
    wwQryParticipanteCD_VERSAO: TFloatField;
    wwQryParticipanteCD_PARTIC: TFloatField;
    wwQryParticipanteCD_PESSOA_PATROC: TFloatField;
    wwQryParticipanteCD_PESSOA_ENTID: TFloatField;
    wwQryParticipanteCD_PLANO: TFloatField;
    wwQryParticipanteCD_TIPO_CAT_PROF_ESP: TFloatField;
    wwQryParticipanteNR_MATRICULA: TStringField;
    wwQryParticipanteNO_PESSOA: TStringField;
    wwQryParticipanteCD_ESTADO_CIVIL: TStringField;
    wwQryParticipanteIR_SEXO: TStringField;
    wwQryParticipanteTP_PARTICIPANTE: TStringField;
    wwQryParticipanteIR_CONDICAO_TRABALHO: TStringField;
    wwQryParticipanteCD_GRUPO_CALCULO: TFloatField;
    wwQryParticipanteDS_REGIONAL: TStringField;
    wwQryParticipanteCD_SITUACAO_PATROC: TFloatField;
    wwQryParticipanteCD_SITUACAO_FUNDACAO: TFloatField;
    wwQryParticipanteNR_CPF: TStringField;
    wwQryGrupoCriticaCD_GRUPO_PARTIC: TFloatField;
    wwQryGrupoCriticaNO_GRUPO_PARTIC: TStringField;
    wwQryGrupoCriticaDS_SQL_ENQUADRAMENTO: TMemoField;
    CkLstBxGrupos: TCheckListBox;
    wwQryGrupoCriticaDS_CONDICAO_EQUADRAMENTO: TMemoField;
    QryMapaTotal: TwwQuery;
    QryMapaDemonst: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure MapaTotais (CD_VERSAO, CD_PARTIC : integer);
    procedure DemonstCritica (CD_VERSAO, CD_PARTIC : integer);
    procedure FormCreate(Sender: TObject);
    function EnquadramentoCritica (CD_VERSAO, CD_PARTIC: Integer; var sValor: String): integer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroupTipoClick(Sender: TObject);
    function GetValorCritica(sSQL: String): String;
  private
     { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOkCriticaParticipante: TfrmOkCriticaParticipante;
  w_linhas, w_linha_Atual : integer;
  w_EnquadraParticipante : TEnquadraParticipante;
  Grupos_Analitico: TStringList;

implementation

uses  uGlobal, FAnimacao, DBaseDados,  uVersaoBase, FTelaAut,
      uFuncGerais, DRelatsAtuarial;


{$R *.DFM}



procedure TfrmOkCriticaParticipante.bbtnConfirmarClick(Sender: TObject);
var
  i: byte;
  Selecionado: Boolean;
begin
  Selecionado := false;
  for i := 0 to CkLstBxGrupos.Items.Count - 1 do
   if CkLstBxGrupos.Checked[i] then
     Selecionado := true;

  if (RadioGroupTipo.ItemIndex = 1) and (not(Selecionado)) then
   begin
     MessageDlg('Selecione uma condição para realizar o Demonstrativo Analítico !',
        mtWarning, [mbOk], 0);
     exit;
   end;     

  try
    qryDelMapaTotal.ExecSQL;
  except   end;
  try
    qryDelMapaDemonst.ExecSQL;
  except   end;
  
  try
    qryCriaMapaTotal.ExecSQL;
  except   end;
  try
    qryCriaMapaDemonst.ExecSQL;
  except   end;

   //-- Recupera grupos de Critica
   wwQryGrupoCritica.Close;
   wwQryGrupoCritica.ParamByName('CD_PESSOA_PATROC').asinteger := WG_CD_PESSOA_PATROC;
   wwQryGrupoCritica.ParamByName('CD_PESSOA_ENTID').asinteger := WG_CD_PESSOA_ENTID;
   wwQryGrupoCritica.ParamByName('CD_PLANO').asinteger := WG_CD_PLANO;
   wwQryGrupoCritica.open;

   if wwQryGrupoCritica.eof then
    begin
      MessageDlg('Falta cadastrar grupos de critica para realizar o enquadramento !',
         mtWarning, [mbOk], 0);
      exit;
    end;

  w_EnquadraParticipante := TEnquadraParticipante.create(self);

 {Recuperar participantes }
  wwQryParticipante.Close;
  wwQryParticipante.ParamByName('CD_VERSAO').asinteger := WG_CD_VERSAO ;

  wwQryParticipante.open;

  if wwQryParticipante.recordcount = 0 then
   begin
     MessageDlg('Falta cadastrar Participantes para realizar o enquadramento !',
        mtWarning, [mbOk], 0);
     exit;
   end;

  bbtnConfirmar.Enabled := false;    

  //-- Cria Form de Animação
  Application.CreateForm(TfrmAnimacao, frmAnimacao);

  w_linhas := wwQryParticipante.recordcount;
  w_linha_Atual := 0;

  frmAnimacao.SetAnimacao ('Crítica de Participantes ...',
                           w_linhas,True,True,aviCopyFiles);



  while not wwQryParticipante.eof do
    begin

    w_linha_atual := w_linha_atual + 1;
    frmAnimacao.SetProgressBar( w_linha_atual );
    if frmAnimacao.Cancel Then
     Begin
       frmAnimacao.Close;
       frmAnimacao.Free;
       MessageDlg('Processamento cancelado por intervenção do usuário.',
          mtInformation, [mbOk], 0);
       bbtnConfirmar.Enabled := true;
       Exit;
     End;
  
    with dtmBaseDados.dbBaseDados do
     begin
      if not InTransaction then
         StartTransaction;
      try

        if RadioGroupTipo.itemindex = 0 then
           //-- Mapa de totais
           MapaTotais (wwQryParticipante.fieldbyname('CD_VERSAO').asinteger,
                       wwQryParticipante.fieldbyname('CD_PARTIC').asinteger)
        else
           //-- Demonstrativo de Crítica
           DemonstCritica (wwQryParticipante.fieldbyname('CD_VERSAO').asinteger,
                                    wwQryParticipante.fieldbyname('CD_PARTIC').asinteger);
        commit;
      except
      on EDatabaseError do
        begin
          bbtnConfirmar.Enabled := true;
          MessageDlg('Erro na geração da crítica do Participante', mtError, [mbOk], 0);
          rollback;
          exit;
        end;
     end;
    end;

   wwQryParticipante.next;

  end;

  bbtnConfirmar.Enabled := true;
  frmAnimacao.Close;
  frmAnimacao.Free;

  
  if RadioGroupTipo.itemindex = 0 then
   begin
     //-- Mapa de totais
     QryMapaTotal.Open;
     if not QryMapaTotal.isEmpty then
       dtmRelatsAtuarial.rpCritica.Print
     else
       MessageDlg('Nenhum participante foi enquadrado no(s) grupo(s) de Críticas.',
          mtInformation, [mbOk], 0);  
     QryMapaTotal.Close;
   end
  else
   begin
     //-- Demonstrativo de Crítica
     QryMapaDemonst.Open;
     if not QryMapaDemonst.isEmpty then
       dtmRelatsAtuarial.rpCriticaDemonst.Print
     else
       MessageDlg('Nenhum participante foi enquadrado no(s) grupo(s) de Críticas.',
          mtInformation, [mbOk], 0);       
     QryMapaDemonst.Close;  
   end;  

  DtmRelatsAtuarial.qryCritica.Close;
  DtmRelatsAtuarial.qryCriticaDemonst.Close;

  try
    qryDelMapaTotal.ExecSQL;
  except   end;
  try
    qryDelMapaDemonst.ExecSQL;
  except   end;

  w_EnquadraParticipante.Free;  
end;

procedure TfrmOkCriticaParticipante.MapaTotais (CD_VERSAO, CD_PARTIC : integer) ;
var
   w_grupo: integer;
   sValor: String;
begin

  wwQryGrupoCritica.first;

  while not wwQryGrupoCritica.eof do
    begin

      if varisnull(wwQryGrupoCritica.fieldbyname('DS_SQL_ENQUADRAMENTO').asstring) then
        begin
          wwQryGrupoCritica.next;
          continue;
        end;

     //-- Recupera grupo de enquadramento do Participante
     w_grupo := EnquadramentoCritica(CD_VERSAO, CD_PARTIC, sValor);

     if w_grupo= 0 then    //-- não enquadrado na crítica
        begin
          wwQryGrupoCritica.next;
          continue;
        end;

      //-- Gera arquivo para emissão
      qryInsMapaTotal.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                         wwQryGrupoCritica.FieldByName('CD_GRUPO_PARTIC').asInteger;
      qryInsMapaTotal.ParamByName('NO_GRUPO_PARTIC').asString :=
                         wwQryGrupoCritica.FieldByName('NO_GRUPO_PARTIC').asString;
      qryInsMapaTotal.ParamByName('DS_CONDICAO').asString :=
        copy(wwQryGrupoCritica.FieldByName('DS_CONDICAO_EQUADRAMENTO').asString, 1, 200);

      qryInsMapaTotal.ExecSQL;

      wwQryGrupoCritica.next;
   end;
end;

procedure TfrmOkCriticaParticipante.DemonstCritica (CD_VERSAO, CD_PARTIC : integer);
var
   w_grupo, i: integer;
   sValor: String;
begin
   wwQryGrupoCritica.first;

   while not wwQryGrupoCritica.eof do
    begin
      for i := 0 to CkLstBxGrupos.Items.Count - 1 do
        if (Trim(wwQryGrupoCritica.FieldByName('NO_GRUPO_PARTIC').asString) =
            Trim(CkLstBxGrupos.Items.Strings[i])) and (not(CkLstBxGrupos.Checked[i])) then
         begin
           wwQryGrupoCritica.next;
           continue;
         end;

      if varisnull(wwQryGrupoCritica.fieldbyname('DS_SQL_ENQUADRAMENTO').asstring) then
        begin
          wwQryGrupoCritica.next;
         continue;
        end;

     //-- Recupera grupo de enquadramento do Participante
     w_grupo := EnquadramentoCritica(CD_VERSAO, CD_PARTIC, sValor);

     if w_grupo = 0 then    //-- não enquadrado na crítica
      begin
        wwQryGrupoCritica.next;
        continue;
      end;

     i := Grupos_Analitico.IndexOf(IntToStr(w_grupo));

     if not ((i >= 0) and (CkLstBxGrupos.Checked[i])) then
      begin
        wwQryGrupoCritica.next;
        continue;
      end;

      //-- Gera arquivo para emissão
        qryInsMapaDemonst.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                     wwQryGrupoCritica.FieldByName('CD_GRUPO_PARTIC').asInteger;
        qryInsMapaDemonst.ParamByName('NO_GRUPO_PARTIC').asString :=
                     wwQryGrupoCritica.FieldByName('NO_GRUPO_PARTIC').asString;
        qryInsMapaDemonst.ParamByName('NR_MATRICULA').asString :=
                     wwQryParticipante.FieldByName('NR_MATRICULA').asString;
        qryInsMapaDemonst.ParamByName('NO_PARTICIPANTE').asString :=
                     wwQryParticipante.FieldByName('NO_PESSOA').asString;
        qryInsMapaDemonst.ParamByName('DS_VALOR').asString := sValor;

        qryInsMapaDemonst.ExecSQL;

      wwQryGrupoCritica.next;

   end;


end;

{-------------------------------------------------------------------}
{Recupera enquadramento do Participante do partir do SQL
registrado em Grupo_Participante - CRITICA}
function TfrmOkCriticaParticipante.EnquadramentoCritica (CD_VERSAO, CD_PARTIC: Integer; var sValor: String): integer;
var
 sql : string;
begin
   EnquadramentoCritica := 0; //-- não enquadrado

   Fquery.close;
   Fquery.SQL.Clear;

   sql := GetValorCritica(wwQryGrupoCritica.fieldbyname('DS_SQL_ENQUADRAMENTO').asstring);
   sql := AtualizaParametros(CD_VERSAO, CD_PARTIC, sql);
   Fquery.SQL.Add(sql);

   Fquery.open;

   if not Fquery.eof then
    begin
      EnquadramentoCritica := wwQryGrupoCritica.fieldbyname('CD_GRUPO_PARTIC').asInteger;

      sValor := FQuery.Fields[0].asString;
    end;
   fQuery.Close; 
end;

procedure TfrmOkCriticaParticipante.FormCreate(Sender: TObject);
begin
  inherited;
   if uGlobal.WG_CD_VERSAO = 0 then
   begin
     ShowMessage('Selecione primerio uma Versão da Base !');
     AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
     close;
     exit;
   end;

  Grupos_Analitico := TStringList.Create;

  BdTemporario.Params.Strings[0] := '';
  BdTemporario.Params.Strings[0] := 'PATH = ' + ExtractFileDir(Application.ExeName);
  BdTemporario.Open;

   //-- Recupera grupos de Critica
   wwQryGrupoCritica.ParamByName('CD_PESSOA_PATROC').asinteger := WG_CD_PESSOA_PATROC;
   wwQryGrupoCritica.ParamByName('CD_PESSOA_ENTID').asinteger := WG_CD_PESSOA_ENTID;
   wwQryGrupoCritica.ParamByName('CD_PLANO').asinteger := WG_CD_PLANO;
   wwQryGrupoCritica.open;
   repeat
     CkLstBxGrupos.Items.Add(wwQryGrupoCritica.FieldByName('NO_GRUPO_PARTIC').asString);
     Grupos_Analitico.Add(IntToStr(wwQryGrupoCritica.FieldByName('CD_GRUPO_PARTIC').asinteger));
     wwQryGrupoCritica.next;
   until wwQryGrupoCritica.EOF;


   CkLstBxGrupos.Enabled := (RadioGroupTipo.ItemIndex = 1);
end;

procedure TfrmOkCriticaParticipante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BdTemporario.Close;
  inherited;
end;

procedure TfrmOkCriticaParticipante.RadioGroupTipoClick(Sender: TObject);
var
  i: byte;
begin
  CkLstBxGrupos.Enabled := (RadioGroupTipo.ItemIndex = 1);
  if RadioGroupTipo.ItemIndex = 0 then
   for i := 0 to CkLstBxGrupos.Items.Count -1 do
     CkLstBxGrupos.Checked[i] := false;
end;

// Pegar Valor do Campo Criticado
// Rômulo Coriolano de Melo - Fórmula Iformática - 19/11/2001
function TfrmOkCriticaParticipante.GetValorCritica(sSQL: String): String;
var
  sCampo, sAux: String;
  i: Word;
begin
  i := pos('FROM', UpperCase(sSQL));
  sAux := copy(sSQL, i, (pos('WHERE', UpperCase(sSQL)) - i));
  //Verifica se possui mais de uma Tabela
  if pos(',', sAux) > 0 then
   begin
     sCampo := Trim(copy(sSQL, pos('AND', UpperCase(sSQL)) + 3, length(sSQL) - (pos('AND', UpperCase(sSQL)) + 3)));
     sCampo := copy(sCampo, 1, pos(' ', sCampo));
   end
  else
   begin
     sCampo := Trim(copy(sSQL, pos('WHERE', UpperCase(sSQL)) + 5, length(sSQL) - (pos('WHERE', UpperCase(sSQL)) + 5)));
     sCampo := copy(sCampo, 1, pos(' ', sCampo));
   end;

   i := pos('1', sSQL);

   if i > 0 then
    sSQL[i] := ' ';
   sSQL := copy(sSQL, 1, i) + ' ' + sCampo + ' ' + copy(sSQL, i + 1, (length(sSQL) - (i + 1)));

   Result := sSQL;
end;

end.
