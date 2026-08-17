{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FParamRelBenefHist;

interface

uses
        Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls,
  TB97, Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, Mask, wwdbedit,
  DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, fcOutlookList, fcButton, fcImgBtn,
  fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar, AppEvnts,
  CMApplicationEvents, StdActns, ActnList, ImgList, fcStatusBar,
  FOkCancelar, Spin, MAHlpBtn,Umenserro, usistema, dbasedados, CheckLst;


type
  TFrmPRelHistBen = class(TfrmOkCancelar)
    Panel1: TPanel;
    Label2: TLabel;
    cmbMes: TComboBox;
    spenedAno: TSpinEdit;
    qryBenef: TwwQuery;
    qrybenefplano: TwwQuery;
    Panel2: TPanel;
    grpTipoRelat: TRadioGroup;
    GroupBox2: TGroupBox;
    qryAux: TwwQuery;
    chklstBenef: TCheckListBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    ListaBenef: TStringList;
  public
    { Public declarations }
  end;

var
  FrmPRelHistBen: TFrmPRelHistBen;

implementation

uses uAdmPrevFB, dRelbenef;

{$R *.DFM}

procedure TFrmPRelHistBen.FormShow(Sender: TObject);
 var ssql: string;
begin
  inherited;
  ListaBenef:=TStringList.Create;
  ssql:='SELECT DISTINCT B.IDBENEFICIO, B.NOME '+
        'FROM PLANPREVPATRO P, BENEFPLANPREV V, BENEFICIO B, PATRO PAT '+
        'WHERE (P.IDPESSJUR = PAT.IDPESSOA) '+
        'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
        'AND (V.IDPLANOPREV = P.IDPLANOPREV) '+
        'AND (B.IDBENEFICIO = V.IDBENEFICIO) '+
        'ORDER BY B.NOME';
  qryBenef.close;
  qryBenef.SQL.Clear;
  qryBenef.SQL.Add(sSQL);
  qryBenef.open;

  chklstBenef.Items.Clear;
  while not qryBenef.eof do
  begin
    chklstBenef.items.add(qryBenef.fieldbyname('Nome').asstring);
    ListaBenef.Add(qryBenef.fieldbyname('IdBeneficio').asstring);
    qryBenef.Next;
  end;
end;

procedure TFrmPRelHistBen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ListaBenef.free;
  qrybenefplano.close;
  qryaux.close;
end;

procedure TFrmPRelHistBen.FormCreate(Sender: TObject);
begin
  inherited;
  cmbMes.ItemIndex   := StrToInt(Copy(DateToStr(Date),4,2))-1;
  spenedAno.Text       := Copy(DateToStr(Date),7,4);
  grpTipoRelat.ItemIndex := dtmRelBenef.tiporelhistbenef;
end;

procedure TFrmPRelHistBen.bbtnConfirmarClick(Sender: TObject);
var
    bFaz      : Boolean;
    sAnoMes   : String;
    I         : Integer;
    sRubricas : String;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  bFaz      := true;
  sRubricas := '';
  if (cmbMes.Text = '') and bFaz then
  begin
    bFaz := false;
    MsgDlg('O Mês é obrigatório !','Aviso', mtInformation,[mbOk,mbHelp],0);
  end;

  If bFaz then
  begin
    if (cmbMes.ItemIndex+1) > 9 then
      sAnoMes := spenedAno.Text + '/'+ IntToStr(cmbMes.ItemIndex+1)
    else
      sAnoMes := spenedAno.Text + '/0'+ IntToStr(cmbMes.ItemIndex+1);

    for i:=0 to chklstBenef.items.count-1 do
      if chklstBenef.checked[I] then
      begin
        qrybenefplano.close;
        qrybenefplano.Parambyname('BENEFICIO').asInteger:=strtoint(ListaBenef[I]);
        qrybenefplano.open;
        sRubricas:=sRubricas+
          IntToStr(qrybenefplano.Fieldbyname('IDRUBRICA').asInteger)+',';
      end;
    sRubricas:=copy(srubricas,1,(length(srubricas)-1));

     If grptiporelat.itemindex = 0 then begin  // sintetico
           dtmrelbenef.qryrelbenhistSINT.sql.clear;
           dtmrelbenef.qryrelbenhistSINT.sql.add(' Select '+
           ' hfb.historico AS VERSAO, '+
           ' PESPATRO.NOME AS EMPRESA, '+
           ' SUM(hst.valorprovento) AS TOTAL '+
           ' from '+
	   ' histrubsal hst, '+
	   ' PESSOA PESPATRO, '+
	   ' hstfolhabenef hfb '+
           ' where '+
	   ' hst.mescobranca = '+quotedstr(sAnomes)+' and '+
	   ' hst.idrubrica in ('+sRubricas+ ') AND ' +
	   ' HST.IDPATRO = PESPATRO.IDPESSOA and '+
           ' hfb.idfundacao = '+inttostr(iidfundacao)+' and '+
	   ' hst.idhstfolhabenef = hfb.idhstfolhabenef '+
           ' GROUP BY hfb.historico,PESPATRO.NOME ');
           dtmrelbenef.RelResFolhaLabel1.Caption := ' Beneficios pagos em '+cmbmes.Items[cmbmes.itemindex]+' de '+spenedAno.Text;
     end else begin // analitico
           dtmrelbenef.qryrelbenhistANAL.sql.clear;
           dtmrelbenef.qryrelbenhistANAL.sql.add(' Select '+
           ' ELG.MATRICULA, '+
	   ' PES.NOME AS NOME_BENEFICIARIO, '+
	   ' PESPATRO.NOME AS EMPRESA, '+
	   ' hst.mescobranca, '+
	   ' hfb.historico AS VERSAO, '+
	   ' sum(hst.valorprovento) AS VALOR '+
           ' FROM '+
	   ' histrubsal hst, '+
	   ' PESSOA PESPATRO, '+
	   ' PESSOA PES, '+
	   ' ELEGPATRO ELG, '+
	   ' hstfolhabenef hfb '+
           ' where '+
	   ' hst.mescobranca = '+quotedstr(sAnomes)+' and '+
	   ' hst.idrubrica in ('+sRubricas+') AND ' +
	   ' HST.IDPATRO = PESPATRO.IDPESSOA and '+
	   ' HST.IDPESSOA = PES.IDPESSOA AND '+
           ' hfb.idfundacao = '+inttostr(iidfundacao)+' and '+
	   ' hst.idhstfolhabenef = hfb.idhstfolhabenef AND '+
	   ' hst.idpessoa = elg.idpessoa '+
           ' group by '+
	   ' ELG.MATRICULA, '+
	   ' PES.NOME  , '+
    	   ' PESPATRO.NOME , '+
	   ' hst.mescobranca, '+
	   ' hfb.historico '+
           ' ORDER BY hfb.historico,PESPATRO.NOME,elg.matricula ');
           dtmrelbenef.ppLabel1.Caption := ' Beneficios pagos em '+cmbmes.Items[cmbmes.itemindex]+' de '+spenedAno.Text;
     end;
  end else
        modalresult := mrNone;

end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
| FILTRO PARA RELAÇÃO DE BENEFÍCIOS PAGOS SINTÉTICO E ANALÍTICO.               |
| NUMREPORT:3012                                                               |
| NUMREPORT:3013                                                               |
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
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2003 A 10/07/2003                         |
| PENDÊNCIA: 14485                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO PARA MULTIFUNDAÇÃO.                                              |
|                                                                              |
|------------------------------------------------------------------------------}

