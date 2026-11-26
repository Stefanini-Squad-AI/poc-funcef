{------------------------------------------------------------------------------|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL: Relatório de ficha financeira mensal individual.        |
| NUMREPORT:1968                                                               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins.                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/07/2002 A 22/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF  - Pendencia 7664.                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para exibir código/descrição externa |
|  conforme a parametrização na tabela PARAMAPREV.                             |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/07/2003 A 14/07/2003                         |
| PENDÊNCIA: 14528                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: André Tavares                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/02/2004 A DD/MM/AAAA                         |
| PENDÊNCIA: 15932                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Criado um novo MontaSelect com uma nova query.   |
| Descriçaõ do erro: O Nome do Recebedor está aparecendo Duplicado na Consulta |
|------------------------------------------------------------------------------}

unit fParamRelFicha;

interface

uses
  Windows, Messages   , SysUtils, Classes , Graphics, Controls, Forms   , Dialogs ,
  Db     , DBTables   , Wwquery , IvDictio, IvMulti , IvEMulti, MAHlpBtn, TB97Tlbr,
  TB97   , StdCtrls   , Buttons , checklst, Mask    , wwdbedit, Wwdbspin, ExtCtrls,
  DBCtrls, MontaSelect, wwdblook, usistema, dbasedados;

type
  TfrmParamRelFicha = class(TForm)
    pnlFundo         : TPanel;
    GroupBox1        : TGroupBox;
    dbseano1         : TwwDBSpinEdit;
    cbmes1           : TComboBox;
    Dock971          : TDock97;
    tb97Fundo        : TToolbar97;
    sep1             : TToolbarSep97;
    sep3             : TToolbarSep97;
    bbtnSair         : TBitBtn;
    bbtnAjuda        : TmaHelpBitBtn;
    TB97oKCancelar   : TToolbar97;
    ToolbarSep971    : TToolbarSep97;
    bbtnConfirmar    : TBitBtn;
    bbtnCancelar     : TBitBtn;
    ivTradutor       : TIvExtendedTranslator;
    grpprocura       : TGroupBox;
    Label1           : TLabel;
    ebeneficiario    : TEdit;
    MontaSelect1     : TMontaSelect;
    Procurar         : TBitBtn;
    GroupBox3        : TGroupBox;
    dbseano2         : TwwDBSpinEdit;
    cbmes2           : TComboBox;
    MontaSelect2: TMontaSelect;
    procedure FormShow(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure ProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure ebeneficiarioExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ebeneficiarioChange(Sender: TObject);
  private
    { Private declarations }
    procedure SqlQryAgrupaRub;
  public
    { Public declarations }
  end;

var
  frmParamRelFicha  : TfrmParamRelFicha;
  consulta          : char;
  montasql          : string;
  procura,checkagem : boolean;

implementation

uses dRelFichaFinanc, uObjFolha, uAdmPrevFB;

{$R *.DFM}

procedure TfrmParamRelFicha.FormShow(Sender: TObject);
var year, month, day : Word;
begin
   // Atualiza as Querys
   decodedate(date,year,month,day);

   cbmes1.itemindex := month-1;
   dbseano1.Value   := Year;
   cbmes2.itemindex := month-1;
   dbseano2.Value   := Year;
   checkagem        := false;

   MontaSelect2.filtro.add('PT.IDFUNDACAO = '+inttostr(iidfundacao));
end;

procedure TfrmParamRelFicha.bbtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmParamRelFicha.ProcurarClick(Sender: TObject);
begin
  montaselect2.executar;
  if (montaselect2.RetornouValor) then
    ebeneficiario.text   := montaselect2.ValoresChave[1];
end;

procedure TfrmParamRelFicha.SqlQryAgrupaRub;
Var sSql: String;
begin
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql := ' SELECT PD.IDPROVENTO AS CODPROVDESC, PD.DESCRICAO, '
  Else
    sSql := ' SELECT PD.CODPROVDESC, PD.DESCRPROVDESC AS DESCRICAO, ';

  sSql := sSql +
  ' SUM(DECODE(PD.FLGDESCONTO, 0, H.VALORPROVENTO)) AS PROVENTO, '+
  ' SUM(DECODE(PD.FLGDESCONTO, 1, H.VALORPROVENTO)) AS DESCONTO '+
  ' FROM '+
    ' HISTRUBSAL H, '+
    ' PROVDESC PD, '+
    ' PESSOA P '+
  ' WHERE '+
    ' H.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND '+
    ' H.IDRESPONSAVEL = :IDRESPONSAVEL AND '+
    ' H.MESCOBRANCA >= :MESINICIO AND '+
    ' H.MESCOBRANCA <= :MESFIM AND '+
    ' H.IDTITULAR = :IDTITULAR AND '+
    ' H.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF AND '+
    ' H.IDMODULO = 18 AND '+
    ' P.IDPESSOA = H.IDRESPONSAVEL AND '+
    ' PD.IDPROVENTO = H.IDRUBRICA ';

  If SistemaFolha.FlgUsaCodRubExt = 0 Then
    sSql := sSql +
    ' GROUP BY '+
      ' PD.IDPROVENTO, '+
      ' PD.DESCRICAO, '+
      ' PD.FLGDESCONTO '+
    ' ORDER BY '+
      ' PD.IDPROVENTO '
  Else
    sSql := sSql +
    ' GROUP BY '+
      ' PD.CODPROVDESC, '+
      ' PD.DESCRPROVDESC, '+
      ' PD.FLGDESCONTO '+
    ' ORDER BY '+
    ' PD.CODPROVDESC ';

  With dtmRelFichaFinanc.qryAgrupaRub do
  begin
    Close;
    Sql.Clear;
    Sql.Add(sSql);
    ParamByName('IDRESPONSAVEL').DataType := ftInteger;
    ParamByName('IDTITULAR').DataType     := ftInteger;
    ParamByName('MESINICIO').DataType     := ftString;
    ParamByName('MESFIM').DataType        := ftString;
  end;
end;

procedure TfrmParamRelFicha.bbtnConfirmarClick(Sender: TObject);
var
  montapatro         : string;
  mes1,ano1          : string;
  mes2,ano2          : string;
  varpessjur         : string;
  idpessjur          : string;
  varidpessoa,codigo : integer;
  year,month,day     : word;
  i                  : integer;
  numero             : real;
begin
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Verifica se os Meses de Referência for'am escolhidos
  If (cbmes1.text = '') Then
  Begin
    ShowMessage('Você precisa digitar o Mês Início de pesquisa');
    Exit;
  End
  Else If (cbmes2.text = '') Then
  Begin
    ShowMessage('Você precisa digitar o Mês Fim de pesquisa');
    Exit;
  End;

  // Passa Mês e Ano para as variáveis
  If cbmes1.ItemIndex < 9 Then mes1 := '0'+inttostr(cbmes1.ItemIndex+1)
  Else mes1 := inttostr(cbmes1.ItemIndex+1);
  If cbmes2.ItemIndex < 9 Then mes2 := '0'+inttostr(cbmes2.ItemIndex+1)
  Else mes2 := inttostr(cbmes2.ItemIndex+1);
  ano1 := dbseano1.Text;
  ano2 := dbseano2.Text;

  with dtmRelFichaFinanc.qryFichaFinanc  do
  begin
    Close;
    SQL.Clear;
    SQL.Add(
    ' SELECT '+
      ' P.NOME, '+
      ' DECODE(HST.FLGTIPOFOLHA, 3, SUBSTR(H.MESCOBRANCA,1,4)||''/13'', 4, SUBSTR(H.MESCOBRANCA,1,4)||''/13'', H.MESCOBRANCA) MES, '+
      ' DECODE(PD.FLGDESCONTO, 0, H.VALORPROVENTO) AS PROVENTO, '+
      ' DECODE(PD.FLGDESCONTO, 1, H.VALORPROVENTO) AS DESCONTO, '+
       'DECODE(PD.FLGESPECIAL, '+
         '0, DECODE(PD.FLGDESCONTO, '+
              '2, NVL(H.VALORINFO,H.VALORPROVENTO)||'' (I)'', '+
              '0, NULL, '+
              '1, DECODE(H.VALORRECEBIDO-H.VALORPROVENTO, '+
                   '0, DECODE(NVL(H.VALORINFO,0), '+
                        '0, NULL, '+
                        'H.VALORINFO||'' (I)''), '+
                   'H.VALORRECEBIDO-H.VALORPROVENTO||'' (R)'')'+
              '), '+
         'DECODE(H.VALORPROVENTO,0,H.VALORINFO, '+
           'NVL(H.VALORPROVENTO,H.VALORINFO))||'' (I)'') INFORMATIVO, ');

    If SistemaFolha.FlgUsaCodRubExt = 0 Then
      SQL.Add(' PD.IDPROVENTO AS CODPROVDESC, PD.DESCRICAO AS DESCRICAO ')
    Else
      SQL.Add(' PD.CODPROVDESC AS CODPROVDESC, PD.DESCRPROVDESC AS DESCRICAO ');

    SQL.Add(
    ' FROM '+
      ' HSTFOLHABENEF HST, '+
      ' HISTRUBSAL H, '+
      ' PROVDESC PD, '+
      ' PESSOA P '+
    ' WHERE '+
      ' HST.IDFUNDACAO = '+IntToStr(iIdFundacao)+' AND '+
      ' H.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF AND '+
      ' H.IDRESPONSAVEL = :IDRESPONSAVEL AND '+
      ' H.MESCOBRANCA >= :MESINICIO AND '+
      ' H.MESCOBRANCA <= :MESFIM AND '+
      ' H.IDTITULAR = :IDTITULAR AND '+
      ' H.IDHSTFOLHABENEF = HST.IDHSTFOLHABENEF AND '+
      ' H.IDMODULO = 18 AND '+
      ' P.IDPESSOA = H.IDRESPONSAVEL AND '+
      ' PD.IDPROVENTO = H.IDRUBRICA '+
    ' ORDER BY '+
      ' MES, '+
      ' PD.FLGDESCONTO ');

    Prepare;
    ParamByName('IDRESPONSAVEL').AsString := MontaSelect2.ValoresChave[0];
    ParamByName('IDTITULAR').AsString     := MontaSelect2.ValoresChave[2];
    ParamByName('MESINICIO').AsString     := ano1+'/'+mes1;
    ParamByName('MESFIM').AsString        := ano2+'/'+mes2;
  end;
  with dtmRelFichaFinanc.qryAgrupaRub do
  begin
    (* Monta o sql para qryAgrupaRub *)
    SqlQryAgrupaRub;
    Close;
    Prepare;
    parambyname('IDRESPONSAVEL').AsString := Montaselect2.ValoresChave[0];
    ParamByName('IDTITULAR').AsString     := MontaSelect2.ValoresChave[2];
    parambyname('MESINICIO').asstring     := ano1+'/'+mes1;
    parambyname('MESFIM').asstring        := ano2+'/'+mes2;
  end;
end;

procedure TfrmParamRelFicha.bbtnCancelarClick(Sender: TObject);
begin
  ebeneficiario.Clear;
end;

procedure TfrmParamRelFicha.ebeneficiarioExit(Sender: TObject);
begin
  consulta  := 'b';
  checkagem := false;
end;

procedure TfrmParamRelFicha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmParamRelFicha.ebeneficiarioChange(Sender: TObject);
begin
  bbtnConfirmar.Enabled := Not (ebeneficiario.Text = '');
end;

end.


