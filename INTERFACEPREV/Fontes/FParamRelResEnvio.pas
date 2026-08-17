// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 08.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FParamRelResEnvio;

interface

uses
  Windows    , Messages, SysUtils, Classes , Graphics, Controls, Forms   , Dialogs  ,
  FOkCancelar, IvDictio, IvMulti , IvEMulti, MAHlpBtn, StdCtrls, Buttons , Spin     ,
  TB97Tlbr   , TB97    , ExtCtrls, Db      , DBTables, Wwquery , checklst, UDataBase;

type
  TfrmParamRelResEnvio = class(TfrmOkCancelar)
    grpMesRef  : TGroupBox;
    cbMes      : TComboBox;
    dbseAno    : TSpinEdit;
    GroupBox1  : TGroupBox;
    chklstPatro: TCheckListBox;
    GroupBox2  : TGroupBox;
    chklstPlano: TCheckListBox;
    qryPatro   : TwwQuery;
    qryPlano   : TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure Fzqry;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelResEnvio            : TfrmParamRelResEnvio;
  LstPatro, LstPlano             : TStringList;
  sPatro  , sPlano, ssql, wAnoMes: String;
  wDia    , wMes  , wAno         : Word;

implementation

uses UFuncoesUteis, dRelatorios, UMensErro, UAdmPrev;

{$R *.DFM}


procedure TfrmParamRelResEnvio.FormShow(Sender: TObject);
begin
  inherited;
  // Inicializa Variáveis
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value   := wAno;
  // Cria Objetos
  LstPlano := TStringList.Create;
  LstPatro := TStringList.Create;
  // Abre Query da Patrocinadora
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatro.Open;

  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPlano.Open;

  // Preencher chkList da Patrocinadora
  CriaLista(ChkLstPatro,QryPatro,LstPatro,'IDPESSOA','NOME');
  // Preencher chkList da Plano
  CriaLista(ChkLstPlano,QryPlano,LstPlano,'IDPLANOPREV','NOME');
end;

procedure TfrmParamRelResEnvio.bbtnCancelarClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  // CheckListBox
  // ------------
  //
  // Patrocinadora
  For I := 0 To ChkLstPatro.Items.Count - 1 Do
  ChkLstPatro.Checked[I] := False;
  // Plano
  For I := 0 To ChkLstPlano.Items.Count - 1 Do
  ChkLstPlano.Checked[I] := False;
  // Variáveis
  DecodeDate(Date, wAno, wMes, wDia);
  cbMes.ItemIndex := wMes - 1;
  dbseAno.Value   := wAno;
end;

procedure TfrmParamRelResEnvio.bbtnConfirmarClick(Sender: TObject);
var
  i:integer;
begin
  inherited;
  // Variáveis
  sPatro := '';
  sPlano := '';
  // CheckListBox
  // ------------
  // Patrocinadora
  For I := 0 To ChkLstPatro.Items.Count - 1 Do
   begin
     if ChkLstPatro.Checked[I] = True then
        sPatro := sPatro + LstPatro.Strings[I]+',';
   end;
  // Plano
  For I := 0 To ChkLstPlano.Items.Count - 1 Do
   begin
     if ChkLstPlano.Checked[I] = True then
        sPlano := sPlano + LstPlano.Strings[I]+',';
   end;
  //
  sPatro := Trim(Copy(sPatro,1,((Length(sPatro)-1))));
  sPlano := Trim(Copy(sPlano,1,((Length(sPlano)-1))));

  // Ano e Mês
  if (cbMes.ItemIndex+1) <= 9 then
      wAnoMes := QuotedStr(Trim(dbseano.Text)+'/0'+IntToStr(cbMes.ItemIndex+1))
  else
      wAnoMes := QuotedStr(Trim(dbseano.Text)+'/'+IntToStr(cbMes.ItemIndex+1));

  // Critica Dados
  if cbMes.ItemIndex = -1 then
   begin
     MsgDlg('Mês de Cobrança não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     cbMes.SetFocus;
     Exit;
   end
  else if  dbseAno.Value = 0 then
   begin
     MsgDlg('Ano de Cobrança não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     dbseAno.Value := wAno;
     dbseano.SetFocus;
     Exit;
   end
  else
   begin
     Fzqry;
     // Coloca Mês de Cobrança no Relatório
     dtmRelatorios.lblMesCobranca.Caption  := cbmes.Text+'/'+dbseano.Text;
     Fazquery(dtmRelatorios.qryResEnvio,ssql);
   end;
end;

Procedure TfrmParamRelResEnvio.Fzqry;
begin
   ssql:= 'SELECT DISTINCT '+
          'PJ.NOME AS PATROCINADORA, '+
          'PP.NOME AS PLANO        , '+
          'DECODE(TD.FLGTIPODESC,''B'',''Benefício'') AS FLGTIPODESC, '+
          'PD.DESCRICAO AS DESCRICAO    , '+
          'COUNT(PD.DESCRICAO) AS QTD          , '+
          'SUM(TD.VALOR) AS TOTAL  '+
          'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPATRO PL, '+
          '(SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV '+
          'WHERE (IDMODULO = 32) AND (OPERACAO = ''B'') AND (ANOMESREF ='+wAnoMes+')) SINC '+
          'WHERE (SINC.NUMCOUNT   > 0) AND'+
          '(TD.MESCOBRANCA  = '+wAnoMes+')AND';
       // Filtra patrocinadora
       if (sPatro <> '') then
          ssql := ssql + '(TD.IDPESSJUR IN ('+sPatro+'))  AND';
       // Filtra Plano
       if (sPlano <> '') then
          ssql := ssql + '(TD.IDPLANOPREV IN ('+sPlano+')) AND';
          ssql := ssql + '(TD.FLGDESCFOLHA = ''P'') AND '+
          '(TD.FLGTIPODESC  = ''B'') AND '+
          '(PL.FLGTPVLR     = ''V'') AND '+
          '(TD.IDPROVENTO   = PD.IDPROVENTO)  AND '+
          '(TD.IDPESSJUR    = PJ.IDPESSOA)    AND '+
          '(TD.IDPLANOPREV  = PP.IDPLANOPREV) AND '+
          '(PL.IDPESSJUR    = PJ.IDPESSOA)    AND '+
          '(PL.IDPLANOPREV  = PP.IDPLANOPREV)'+
          'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO '+
          'UNION '+
          'SELECT DISTINCT '+
          'PJ.NOME AS PATROCINADORA, '+
          'PP.NOME AS PLANO        , '+
          'DECODE(TD.FLGTIPODESC,''A'',''Contribuições Assistenciais'') AS FLGTIPODESC  , '+
          'PD.DESCRICAO AS DESCRICAO , '+
          'COUNT(PD.DESCRICAO) AS QTD , '+
          'SUM(TD.VALOR) AS TOTAL '+
          'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPATRO PL, '+
          '(SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV '+
          'WHERE (IDMODULO = 32) AND (OPERACAO = ''A'') AND (ANOMESREF = '+wAnoMes+')) SINC '+
          'WHERE (SINC.NUMCOUNT   > 0) AND '+
          '(TD.MESCOBRANCA  = '+wAnoMes+') AND ';
       // Filtra patrocinadora
       if (sPatro <> '') then
          ssql := ssql + '(TD.IDPESSJUR IN ('+sPatro+')) AND';
       // Filtra Plano
       if (sPlano <> '') then
          ssql := ssql + '(TD.IDPLANOPREV IN ('+sPlano+')) AND';
          ssql := ssql + '(TD.FLGDESCFOLHA = ''P'') AND '+
          '(TD.FLGTIPODESC  = ''A'') AND '+
          '(PL.FLGTPVLR     = ''V'') AND '+
          '(TD.IDPROVENTO   = PD.IDPROVENTO) AND '+
          '(TD.IDPESSJUR    = PJ.IDPESSOA) AND '+
          '(TD.IDPLANOPREV  = PP.IDPLANOPREV) AND '+
          '(PL.IDPLANOPREV  = PP.IDPLANOPREV)'+
          'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO '+
          'UNION '+
          'SELECT DISTINCT '+
          'PJ.NOME AS PATROCINADORA, '+
          'PP.NOME AS PLANO        , '+
          'DECODE(TD.FLGTIPODESC,''E'',''Contribuições de Empréstimo'') AS FLGTIPODESC  , '+
          'PD.DESCRICAO AS DESCRICAO    , '+
          'COUNT(PD.DESCRICAO) AS QTD          , '+
          'SUM(TD.VALOR) AS TOTAL '+
          'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPATRO PL, '+
          '(SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV '+
          'WHERE (IDMODULO = 32) AND (OPERACAO = ''E'') AND (ANOMESREF = '+wAnoMes+' )) SINC '+
          'WHERE (SINC.NUMCOUNT   > 0) AND '+
          '(TD.MESCOBRANCA  ='+wAnoMes+')AND ';
       // Filtra patrocinadora
       if (sPatro <> '') then
          ssql := ssql + '(TD.IDPESSJUR IN ('+sPatro+'))  AND';
       // Filtra Plano
       if (sPlano <> '') then
          ssql := ssql + '(TD.IDPLANOPREV IN ('+sPlano+')) AND';
          ssql := ssql + '(TD.FLGDESCFOLHA = ''P'')  AND '+
          '(TD.FLGTIPODESC  = ''E'') AND '+
          '(PL.FLGTPVLR     = ''V'') AND '+
          '(TD.IDPROVENTO   = PD.IDPROVENTO) AND '+
          '(TD.IDPESSJUR    = PJ.IDPESSOA) AND '+
          '(TD.IDPLANOPREV  = PP.IDPLANOPREV) AND '+
          '(PL.IDPLANOPREV  = PP.IDPLANOPREV) '+
          'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO '+
          'UNION '+
          'SELECT DISTINCT '+
          'PJ.NOME AS PATROCINADORA, '+
          'PP.NOME AS PLANO , '+
          'DECODE(TD.FLGTIPODESC,''P'',''Taxas ou Valores das Contribuições Normais'') AS FLGTIPODESC, '+
          'PD.DESCRICAO AS DESCRICAO    , '+
          'COUNT(PD.DESCRICAO) AS QTD , '+
          'SUM(TD.VALOR)AS TOTAL '+
          'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPATRO PL, '+
          '(SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV '+
          'WHERE (IDMODULO = 32) AND (OPERACAO = ''P'') AND (ANOMESREF = '+wAnoMes+') AND '+
          '(TIPOENVPREV IN(''V'',''A''))) SINC '+
          'WHERE (SINC.NUMCOUNT > 0) AND'+
          '(TD.MESCOBRANCA    = '+wAnoMes+') AND';
       // Filtra patrocinadora
       if (sPatro <> '') then
          ssql := ssql + '(TD.IDPESSJUR IN ('+sPatro+'))  AND';
       // Filtra Plano
       if (sPlano <> '') then
          ssql := ssql + '(TD.IDPLANOPREV IN ('+sPlano+')) AND';
          ssql := ssql + '(TD.FLGDESCFOLHA   = ''P'') AND '+
          '(TD.FLGTIPODESC    = ''P'') AND '+
          '(TD.FLGATRASODEVOL = ''N'') AND '+
          '(PL.FLGTPVLR       = ''V'') AND '+
          '(TD.IDPROVENTO     = PD.IDPROVENTO) AND '+
          '(TD.IDPESSJUR      = PJ.IDPESSOA) AND '+
          '(TD.IDPLANOPREV    = PP.IDPLANOPREV) AND '+
          '(PL.IDPLANOPREV    = PP.IDPLANOPREV) '+
          'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO '+
          'UNION '+
          'SELECT DISTINCT '+
          'PJ.NOME AS PATROCINADORA, '+
          'PP.NOME AS PLANO, '+
          'DECODE(TD.FLGTIPODESC,''P'',''Inscritos'') AS FLGTIPODESC  , '+
          'PD.DESCRICAO AS DESCRICAO    , '+
          'COUNT(PD.DESCRICAO) AS QTD          , '+
          'SUM(TD.VALOR) AS TOTAL '+
          'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPATRO PL, '+
          '(SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV '+
          'WHERE (IDMODULO = 32) AND (OPERACAO = ''P'') AND (ANOMESREF = '+wAnoMes+') AND '+
          '(TIPOENVPREV IN(''N'',''A''))) SINC '+
          'WHERE (SINC.NUMCOUNT   > 0) AND '+
          '(TD.MESCOBRANCA  = '+wAnoMes+')AND '+
          '(FLGINTEVENTO IN (''IP'',''RM''))  AND ';
       // Filtra patrocinadora
       if (sPatro <> '') then
          ssql := ssql + '(TD.IDPESSJUR IN ('+sPatro+'))  AND';
       // Filtra Plano
       if (sPlano <> '') then
          ssql := ssql + '(TD.IDPLANOPREV IN ('+sPlano+')) AND';
          ssql := ssql + '(TD.FLGDESCFOLHA = ''P'') AND '+
          '(TD.FLGTIPODESC  = ''P'') AND '+
          '(PL.FLGTPVLR     = ''V'') AND '+
          '(TD.IDPROVENTO   = PD.IDPROVENTO)  AND '+
          '(TD.IDPESSJUR    = PJ.IDPESSOA)  AND '+
          '(TD.IDPLANOPREV  = PP.IDPLANOPREV) AND '+
          '(PL.IDPLANOPREV  = PP.IDPLANOPREV) '+
          'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO '+
          'UNION '+
          'SELECT DISTINCT '+
          'PJ.NOME  AS PATROCINADORA, '+
          'PP.NOME  AS PLANO        , '+
          'DECODE(TD.FLGTIPODESC,''P'' ,''Desligados'') AS FLGTIPODESC  , '+
          'PD.DESCRICAO AS DESCRICAO    , '+
          'COUNT(PD.DESCRICAO) AS QTD          , '+
          'SUM(TD.VALOR) AS TOTAL '+
          'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPATRO PL, '+
          '(SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV '+
          'WHERE (IDMODULO = 32) AND (OPERACAO = ''P'') AND (ANOMESREF = '+wAnoMes+') AND '+
          '(TIPOENVPREV IN(''N'',''A''))) SINC  '+
          'WHERE (SINC.NUMCOUNT   > 0) AND '+
          '(TD.MESCOBRANCA  = '+wAnoMes+') AND'+
          '(FLGINTEVENTO IN (''DC'',''RA'',''DM'',''DS'',''DA'')) AND '+
          '(TD.FLGDESCFOLHA = ''P'') AND '+
          '(TD.FLGTIPODESC  = ''P'') AND '+
          '(PL.FLGTPVLR     = ''V'') AND '+
          '(TD.IDPROVENTO   = PD.IDPROVENTO) AND '+
          '(TD.IDPESSJUR    = PJ.IDPESSOA)AND '+
          '(TD.IDPLANOPREV  = PP.IDPLANOPREV) AND '+
          '(PL.IDPLANOPREV  = PP.IDPLANOPREV) '+
          'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO ';
end;
end.
