unit FPRelDemPag;

// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Pendência   : SOL 158705.5441 KINTANA 1345367
//Responsável : ALINE FREIRE
//Data        : 28/06/2011
//Descrição   : Aumentei o campo Logradouro para 80 posições.
//--------------------------------------------------------------------------------
// Autor(a)    :  Jéssica Lana
// Data        :  27/02/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Spin, Db, DBTables, Wwquery,
  MontaSelect, Wwdatsrc, uGImp, UDatabase, CheckLst, uString,
  UObjFolha, usistema, dbasedados, UMensErro, uAdmPrevFB, UFuncoesFolha,
  UFuncoesUteisFB, dRelFolha;

type
  TContraCheque = Class(TStringList)
    Function Monta(qry, QryAux: TwwQuery; aiOpcao: integer;
      lbMensagem: tlabel): Boolean;
    Function EspacoAEsq(Texto: String; Tam: Integer):String;
    Procedure Cria;
    Procedure Limpa;
  end;

  TfrmPRelDemPag = class(TfrmOkCancelar)
    pnlInformacoes: TPanel;
    grpMesRef: TGroupBox;
    qry: TwwQuery;
    qryHistorico: TwwQuery;
    dblcHistorico: TwwDBLookupCombo;
    Splitter1: TSplitter;
    qryAux: TwwQuery;
    Panel1: TPanel;
    Label1: TLabel;
    mmMSG: TMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter2: TSplitter;
    chklstPatro: TCheckListBox;
    chklstPlano: TCheckListBox;
    cboxPatro: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    cboxPlano: TCheckBox;
    gbSalva: TGroupBox;
    Bevel1: TBevel;
    lblSalvar: TLabel;
    SpeedButton4: TSpeedButton;
    dlgArquivo: TSaveDialog;
    Panel5: TPanel;
    Label4: TLabel;
    cboxPortforma: TCheckBox;
    chklstPortforma: TCheckListBox;
    Panel6: TPanel;
    Label5: TLabel;
    chklstCidade: TCheckListBox;
    cboxCidade: TCheckBox;
    CboxSubMsg: TCheckBox;
    qryMSG: TwwQuery;
    mmMSGant: TMemo;
    qryCalendatas: TwwQuery;
    lblMsg: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcHistoricoChange(Sender: TObject);
    procedure cboxPatroClick(Sender: TObject);
    procedure cboxPlanoClick(Sender: TObject);
    procedure cboxPortformaClick(Sender: TObject);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure chklstPlanoClickCheck(Sender: TObject);
    procedure chklstPortformaClickCheck(Sender: TObject);
    procedure chklstPatroClick(Sender: TObject);
    procedure chklstPlanoClick(Sender: TObject);
    procedure chklstPortformaClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure cboxCidadeClick(Sender: TObject);
    procedure chklstCidadeClickCheck(Sender: TObject);
    procedure chklstCidadeClick(Sender: TObject);

  private
    ListaPatro: tstringlist;
    ListaPlano: tstringlist;
    ListaPortforma: tstringlist;
    ListaCidades: tstringlist;

    sPatroSel, sPlanoSel, sPortformaSel, sIdCidadesSel: string;

    Function MontaQuery(Qry: TwwQuery): boolean;
    procedure DeterminaPatroSel;
    procedure DeterminaPlanoSel;
    procedure DeterminaPortforma;
    procedure DeterminaCidades;
    procedure MontaListaPatro;
    procedure MontaListaPlano;
    procedure MontaListaPortforma;
    procedure MontaListaCidades;
    procedure VerificaProcessa;
    procedure SubstituiMensagem;
  public
    { Public declarations }
  end;

var
  frmPRelDemPag: TfrmPRelDemPag;
  ContraCheque: TContraCheque;
    inumdepirrf : Integer;
    iflgisentoirrf : Integer;
    dtdatanasc : tDateTime;
    dtproxpag  : tDateTime;
    iimolestiagrava : Integer;
    iiSomairrfinss : Integer;
    iidtitular : Integer;
    iidpatro : Integer;
    iidplanoprev : Integer;
    iidbeneficio : Integer;
    iidresponsavel : Integer;
    mesproximo : String;

implementation

{$R *.DFM}

function LeftPad(Texto:string;Tam:byte):string;  {margeia o texto pela esqueda}
begin
  Texto := trim(Copy(Texto,1,Tam));
  Texto := Texto + Replicate(' ',Tam-Length(Texto));
  LeftPad := Texto;
end;

function RightPad(Texto:string;Tam:byte):string;  {margeia o texto pela direita}
begin
  Texto := trim(Copy(Texto,1,Tam));
  Texto := Replicate('0',Tam-Length(Texto)) + Texto;
  RightPad := Texto;
end;

procedure TfrmPRelDemPag.FormCreate(Sender: TObject);
 var s:string;
begin
  inherited;

  //Jéssica Lana SOL 109421 KINTANA 496332
  lblSalvar.Caption:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\ArqCheque.dat';

  ListaPatro:=tstringlist.create;
  ListaPlano:=tstringlist.create;
  ListaPortforma:=tstringlist.create;
  ListaCidades:=tstringlist.create;
  qryHistorico.Open;
end;

procedure TfrmPRelDemPag.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  lblMsg.visible:=true;
  lblMsg.caption:='Buscando dados. Aguarde...';
  lblMsg.update;
  if not MontaQuery(Qry) then
    Exit;
  ContraCheque.Monta(Qry, qryAux, SistemaFolha.ContraChequePorPagina, lblMsg);
  ContraCheque.SaveToFile(lblSalvar.caption);
  lblMsg.visible:=false;
  ShowMessage('Geração concluída.');

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  bbtnConfirmar.Enabled:=False;
end;

procedure TfrmPRelDemPag.DeterminaPatroSel;
begin
  If (Not cboxPatro.checked)And(chklstPatro.ItemIndex>=0) then
    MontaFiltro(chklstPatro, ListaPatro, sPatroSel);
end;

procedure TfrmPRelDemPag.DeterminaPlanoSel;
begin
  If (Not cboxPlano.checked)And(chklstPlano.ItemIndex>=0) then
    MontaFiltro(chklstPlano, ListaPlano, sPlanoSel);
end;

procedure TfrmPRelDemPag.DeterminaPortforma;
begin
  If (Not cboxPortForma.checked)And(chklstPortForma.ItemIndex>=0) then
    MontaFiltro(chklstPortforma, ListaPortforma, sPortformaSel);
end;

procedure TfrmPRelDemPag.DeterminaCidades;
begin
  If (Not cboxCidade.checked)And(chklstCidade.ItemIndex>=0) then
    MontaFiltro(chklstCidade, ListaCidades, sIdCidadesSel);
end;

procedure TfrmPRelDemPag.MontaListaPatro;
begin
  chklstPatro.items.clear;
  ListaPatro.clear;
  if FazQuery(qryAux, 'SELECT DISTINCT PP.IDPESSOA, P.NOME '+
      'FROM HISTRUBSAL H, PATRO PP, PESSOA P '+
      'WHERE (H.IDHSTFOLHABENEF = '+
      inttostr(qryHistorico.FieldByName('IDHSTFOLHABENEF').asinteger)+') '+
      'AND (H.IDPATRO = PP.IDPESSOA) '+
      'AND (PP.IDPESSOA = P.IDPESSOA) '+
      'ORDER BY P.NOME') then
    while not qryAux.eof do
    begin
      chklstPatro.items.add(qryAux.fieldbyname('NOME').asstring);
      chklstPatro.ItemIndex:=0;
      ListaPatro.add(qryAux.fieldbyname('IDPESSOA').asstring);
      qryAux.Next;
    end;
end;

procedure TfrmPRelDemPag.MontaListaPlano;
begin
  chklstPlano.items.clear;
  ListaPlano.clear;

  if FazQuery(qryAux, 'SELECT DISTINCT PP.IDPLANOPREV, PP.NOME '+
      'FROM HISTRUBSAL H, PLANPREV PP '+
      'WHERE (H.IDHSTFOLHABENEF = '+
      inttostr(qryHistorico.FieldByName('IDHSTFOLHABENEF').asinteger)+') '+
      'AND (H.IDPLANOPREV = PP.IDPLANOPREV) '+
      'ORDER BY PP.NOME') then
    while not qryAux.eof do
    begin
      chklstPlano.items.add(qryAux.fieldbyname('NOME').asstring);
      chklstPlano.ItemIndex:=0;
      ListaPlano.Add(qryAux.fieldbyname('IDPLANOPREV').asstring);
      qryAux.next;
    end;
end;

procedure TfrmPRelDemPag.MontaListaPortforma;
begin
  chklstPortforma.items.clear;
  ListaPortforma.clear;

  if FazQuery(qryAux, 'SELECT DISTINCT P.CODPORTFORMA, P.DESCRICAO '+
      'FROM HISTRUBSAL H, PORTADORFORMA P '+
      'WHERE (H.IDHSTFOLHABENEF = '+
      inttostr(qryHistorico.FieldByName('IDHSTFOLHABENEF').asinteger)+') '+
      'AND (H.CODPORTFORMA = P.CODPORTFORMA) '+
      'ORDER BY P.DESCRICAO') then
    while not qryAux.eof do
    begin
      chklstPortforma.items.add(qryAux.fieldbyname('DESCRICAO').asstring);
      chklstPortForma.ItemIndex:=0;
      ListaPortforma.Add(qryAux.fieldbyname('CODPORTFORMA').asstring);
      qryAux.next;
    end;
end;

procedure TfrmPRelDemPag.MontaListaCidades;
begin
  chklstCidade.items.clear;
  ListaCidades.clear;
  if FazQuery(qryAux,'SELECT DISTINCT CD.IDCIDADES, CD.NOME'+
                     ' FROM HISTRUBSAL HT, CIDADES CD, ENDPESS EP '+
                     ' WHERE '+
                     ' (HT.IDHSTFOLHABENEF = '+
                     IntToStr(qryHistorico.FieldByName('IDHSTFOLHABENEF').asinteger)+') AND '+
                     ' (HT.IDRESPONSAVEL = EP.IDPESSOA) AND '+
                     ' (EP.IDCIDADES = CD.IDCIDADES) '+
                     ' ORDER BY CD.NOME') then
  While not qryAux.eof do
  begin
    chklstCidade.items.add(qryAux.fieldbyname('NOME').asstring);
    chklstCidade.ItemIndex:=0;
    ListaCidades.Add(qryAux.fieldbyname('IDCIDADES').asstring);
    qryAux.next;
  end;
end;

{ ContraCheque }

procedure TContraCheque.Cria;
begin
  ContraCheque := TContraCheque.Create;
  ContraCheque.Capacity := 1000000; 
  ContraCheque.Duplicates := dupAccept; // permite linhas duplicadas;
end;

procedure TContraCheque.Limpa;
begin
  ContraCheque.Clear;
  ContraCheque.Free;
end;

function TContraCheque.Monta(Qry, QryAux: TwwQuery; aiOpcao: integer;
  lbMensagem: tlabel): Boolean;
 var sTexto: String;
     iUltTitular, iUltRecebedor, iLinha, iPageAtual, iTotPage: Integer;
     rResiduo,
     rTotProvento, rTotDesconto, rTotLiquido, rTotResiduo: Real;
     iLadoPagina, iCont: Integer;
     sNumSeq, 
     sinfo, ssql, snomebanco, snumprocinss: string;
     sendE1, sendE2, sendE3, sendE4, sendD1, sendD2, sendD3, sendD4: string;
     tbmRub: tbookmark;
     rPercent, rValorSRB, rValorPrev, rValorBase1 : Real;
     sMatricBenef : String;
     bImprimiu : Boolean; 
     iContracheque: integer;
     lstBanco: tstringlist;
     bachou: boolean;

begin
  iContracheque:=0;
  lstBanco:=tstringlist.create;

  ContraCheque.Cria;
  //  prepara o loop
  Result := True;

 {PARAMETRO TEXTO PARA COLOCAR NO INICIO DO ARQUIVO TEXTO DE CONTRA-CHEQUE}
  if prmCabecArqCC <> '' then
    ContraCheque.Add(prmCabecArqCC);

  // controla a qry
  qry.First;
  iUltTitular:=qry.FieldByName('IDTITULAR').AsInteger;
  iUltRecebedor:=qry.FieldByName('IDRESPONSAVEL').AsInteger;
  iLadoPagina:=0;
  while not qry.Eof do
  begin
    //CONTROLE DE TOTAL DE PAGINAS
    iLinha:=0;
    rTotProvento:=0;
    rTotDesconto:=0;
    rTotResiduo:=0;
    tbmRub:=qry.getbookmark;

    inumdepirrf :=  qry.FieldByName('NUMDEPIRRF').AsInteger;
    iidtitular := qry.FieldByName('IDTITULAR').AsInteger;
    iidpatro := qry.FieldByName('IDPATRO').AsInteger;
    iiDPlanoPrev := qry.FieldByName('IDPLANOPREV').AsInteger;
    dtdatanasc := qry.FieldByName('DATANASC').AsDateTime;
    iidresponsavel := qry.FieldByName('IDRESPONSAVEL').AsInteger;
    mesproximo :=  qry.FieldByName('MESREFERENCIA').AsString;

    inc(icontracheque);
    lbMensagem.caption:='Montando contracheque '+inttostr(icontracheque)+'. Aguarde...';
    lbMensagem.update;

    while not (qry.Eof) and
          (iUltTitular = qry.FieldByName('IDTITULAR').AsInteger) and
          (iUltRecebedor = qry.FieldByName('IDRESPONSAVEL').AsInteger) do
    begin
      // 8ª linha layout: mesref(7);codrubrica(6);descr.rubrica(60);tipo rub(1)=(P/D);vlr rub.(17);vlr assoc.(17)
      // alimenta variáveis
      // Na 8ª linha layout acrescentar ao final a parcela(5)
      if qry.FieldByName('TPRUBRICA').AsString = 'P' then
      begin
        rTotProvento:=rTotProvento+qry.FieldByName('VALORPROVENTO').AsFloat;
        rResiduo:=0;
      end
      else
      begin
        If qry.fieldbyname('TPRUBRICA').asstring = 'D' then
        begin
            rResiduo:=qry.FieldByName('VALORRECEBIDO').asfloat-
                      qry.FieldByName('VALORPROVENTO').asfloat;
            rTotResiduo:=rTotResiduo+rResiduo;
            rTotDesconto:=rTotDesconto+qry.FieldByName('VALORPROVENTO').AsFloat;
        end else
           rResiduo := 0;
      end;
      Inc(iLinha);
      if rResiduo = 0 then
        sinfo:=formatfloat('#0.00',qry.FieldByName('VALORINFO').asfloat)+' (I)'
      else
        sinfo:=formatfloat('#0.00',rResiduo)+' (R)';
      qry.Next;
    end;
    rTotLiquido := rTotProvento - rTotDesconto;
    iTotPage:=iLinha div 30;
    if iLinha mod 30 <> 0 then
      inc(iTotPage);
    qry.gotobookmark(tbmRub);

    if qry.fieldbyname('NUMPROCINSS').isnull then
    begin
      //Identifica número do processo do INSS
      ssql:='SELECT BBF.NUMPROCINSS FROM HSTBENEFBFCIARIO HBF, BENEFBFCIARIO BBF '+
            'WHERE HBF.IDHSTFOLHABENEF = '+inttostr(qry.FieldByName('IDHSTFOLHABENEF').asinteger)+' '+
            'AND HBF.IDPESSJUR = '+inttostr(qry.FieldByName('IDPATRO').asinteger)+' '+
            'AND HBF.IDPLANOPREV = '+inttostr(qry.FieldByName('IDPLANOPREV').asinteger)+' '+
            'AND HBF.IDTITULAR = '+inttostr(qry.FieldByName('IDTITULAR').asinteger)+' '+
            'AND HBF.NUMEROPROCESSO = BBF.NUMEROPROCESSO '+
            'AND HBF.IDPESSJUR = BBF.IDPESSJUR '+
            'AND HBF.IDPLANOPREV = BBF.IDPLANOPREV '+
            'AND HBF.IDTITULAR = BBF.IDTITULAR '+
            'AND HBF.IDPESSOA = BBF.IDPESSOA '+
            'AND HBF.IDBENEFICIO = BBF.IDBENEFICIO '+
            'AND BBF.NUMPROCINSS IS NOT NULL';

      if FazQuery(qryAux, ssql) then
        snumprocinss:=copy(qryAux.fieldbyname('NUMPROCINSS').asstring,1,15)
      else
        snumprocinss:='';
    end
    else
      snumprocinss:=qry.fieldbyname('NUMPROCINSS').asstring;

    bachou:=false;
    for icont:=0 to lstBanco.count-1 do
    begin
      if copy(lstBanco[iCont],1,3) = qry.FieldByName('NUMBANCO').AsString then
      begin
        bachou:=true;
        break;
      end;
    end;
    if bachou then
    begin
      snomebanco:=copy(lstBanco[iCont],4,length(lstBanco[iCont]));
    end
    else
    begin
      ssql:='SELECT PB.NOME '+
            'FROM BANCO B, PESSOA PB '+
            'WHERE B.NUMBANCO = '+QuotedStr(qry.FieldByName('NUMBANCO').AsString)+' '+
            'AND B.IDPESSOA = PB.IDPESSOA ';
      if FazQuery(qryAux, ssql) then
      begin
        snomebanco:=copy(qryAux.fieldbyname('NOME').asstring,1,60);
        lstBanco.add(qry.FieldByName('NUMBANCO').AsString+snomebanco);
      end
      else
        snomebanco:='';
    end;

    If aiOpcao = 2 Then Begin
      sSql := 'select distinct h.valorsrb from hstbenefbfciario h, benefplanprev b '+
              'where h.idhstfolhabenef = '+IntToStr(qry.FieldByName('IDHSTFOLHABENEF').AsInteger)+' '+
              'and h.idtitular = '+IntToStr(qry.FieldByName('IDTITULAR').AsInteger)+' '+
              'and b.idbeneficio = h.idbeneficio '+
              'and b.idplanoprev = h.idplanoprev '+
              'and b.flgreferencia = 0 ';

      If FazQuery(qryAux, ssql) Then
        rValorSRB := qryAux.FieldByName('VALORSRB').AsFloat
      Else
        rValorSRB := 0;



      sSql := 'select distinct h.valorprev,h.idbeneficio from hstbenefbfciario h, benefplanprev b '+
              'where h.idhstfolhabenef = '+IntToStr(qry.FieldByName('IDHSTFOLHABENEF').AsInteger)+' '+
              'and h.idtitular = '+IntToStr(qry.FieldByName('IDTITULAR').AsInteger)+' '+
              'and b.idbeneficio = h.idbeneficio '+
              'and b.idplanoprev = h.idplanoprev '+
              'and b.flgreferencia = 1 ';

      rValorPrev := 0;
      iidbeneficio := 0;

      If FazQuery(qryAux, ssql) Then
        begin
           rValorPrev := qryAux.FieldByName('VALORPREV').AsFloat;
           iidbeneficio := qryAux.FieldByName('IDBENEFICIO').AsInteger;
        end;


      sSql := 'select distinct h.ValorBase1 from hstbenefbfciario h, benefplanprev b '+
              'where h.idhstfolhabenef = '+IntToStr(qry.FieldByName('IDHSTFOLHABENEF').AsInteger)+' '+
              'and h.idtitular = '+IntToStr(qry.FieldByName('IDTITULAR').AsInteger)+' '+
              'and b.idbeneficio = h.idbeneficio '+
              'and b.idplanoprev = h.idplanoprev ';

      If FazQuery(qryAux, ssql) Then
        rValorBase1 := qryAux.FieldByName('VALORBASE1').AsFloat
      Else
        rValorBase1 := 0;

      ssql := ' SELECT DISTINCT ''% RATEIO'' AS NOME, BFC.PERCENTUAL AS FATOR '+
              ' FROM HSTBENEFBFCIARIO H, BENEFPLANPREV BPV, BFCIARIOTITPLAN BFC, BENEFICIO B '+
              ' WHERE H.IDTITULAR = '+IntToStr(qry.FieldByName('IDTITULAR').AsInteger)+
              ' AND H.IDPESSOA        = '+IntToStr(qry.FieldByName('IDPESSOA').AsInteger)+
              ' AND H.MES             = '+QuotedStr(qry.FieldByName('MESCOBRANCA').AsString)+
              ' AND H.MESREFERENCIA   = '+QuotedStr(qry.FieldByName('MESREFERENCIA').AsString)+
              ' AND H.IDPESSOA <> H.IDTITULAR AND H.IDPLANOPREV = BPV.IDPLANOPREV AND '+
              ' H.IDBENEFICIO = BPV.IDBENEFICIO AND BPV.FLGREFERENCIA = 0 AND '+
              ' H.IDPLANOPREV = BFC.IDPLANOPREV AND H.IDPESSJUR = BFC.IDPESSJUR AND '+
              ' H.IDBENEFICIO = BFC.IDBENEFICIO AND H.IDPESSOA = BFC.IDPESSOA AND '+
              ' H.IDTITULAR = BFC.IDTITULAR AND H.SEQPROPOSTA = BFC.SEQPROPOSTA AND '+
              ' B.IDBENEFICIO = H.IDBENEFICIO AND B.TIPOBENEFICIO <> 99 ';

      If FazQuery(qryAux, ssql) Then
        rPercent := qryAux.FieldByName('FATOR').AsFloat
      Else
        rPercent := 0;


      sSql := ' SELECT MATRICULA, NUMSEQUENCIA FROM DEPENTIT WHERE '+
              ' IDTITULAR = '+IntToStr(qry.FieldByName('IDTITULAR').AsInteger)+
              ' AND IDPESSOA  = '+IntToStr(qry.FieldByName('IDPESSOA').AsInteger);

      If FazQuery(qryAux, ssql) Then
      begin
        sMatricBenef := qryAux.FieldByName('MATRICULA').AsString;
        sNumSeq      := qryAux.FieldByName('NUMSEQUENCIA').AsString; 
      end
      Else
      begin
        sMatricBenef := '';
        sNumSeq      := ''; 
      end;

    End;

    //CONTROLE DE TOTAL DE PAGINAS
    for iPageAtual:=1 to iTotPage do
    begin
      // * * * Monta a estrutura de acordo com as faixas
      // 1ª linha layout: mespagamento(07);versão folha(08)
      sTexto := '01001'+Trim(qry.FieldByName('MESCOBRANCA').AsString)+
                EspacoAEsq(qry.FieldByName('IDHSTFOLHABENEF').AsString,8)+
                formatdatetime('dd/mm/yyyy',qry.FieldByName('DATAPAGAMENTO').asdatetime)+
                EspacoAEsq(snumprocinss,15);
      ContraCheque.Add(sTexto);

      // 2ª linha layout: matricula(14);inscricao(14);nome titular(60)
      sTexto := '01002'+EspacoaEsq(Trim(qry.FieldByName('MATRICULA').AsString),14)+
                EspacoaEsq(Trim(qry.FieldByName('INSCRICAONUMERO').AsString),14)+
                EspacoaEsq(Trim(qry.FieldByName('NOMETITULAR').AsString),60)+
                EspacoaEsq(Trim(sNumSeq), 2); 
      ContraCheque.Add(sTexto);

      // 3ª linha layout: patrocinadora(60);plano(60)
      sTexto := '01003'+EspacoaEsq(Trim(qry.FieldByName('PATRO').AsString),60)+
                EspacoaEsq(Trim(qry.FieldByName('PLANO').AsString),60);

      If aiOpcao = 2 Then
        sTexto:=sTexto+AD(formatfloat('#0.00000000',rValorBase1),15)+
                AD(formatfloat('#0.00',rValorSrb),15)+
                AD(formatfloat('#0.00',rValorPrev),15);
      ContraCheque.Add(sTexto);

      // 4ª linha layout: nome receb.(60);datanasc.(10);isentoirrf(1)=(0/1);numdepirrf(3)
      sTexto := '02001'+EspacoaEsq(Trim(qry.FieldByName('NOMERECEBEDOR').AsString),60)+
                EspacoaEsq(Trim(qry.FieldByName('DATANASC').AsString),10)+
                EspacoaEsq(Trim(qry.FieldByName('ISENTOIRRF').AsString),3)+  
                EspacoaEsq(Trim(qry.FieldByName('NUMDEPIRRF').AsString),3);

      If aiOpcao = 2 Then
        sTexto:=sTexto+AD(formatfloat('#0.00000000',rPercent),15)+
                EspacoaEsq(Trim(sMatricBenef),14);

      ContraCheque.Add(sTexto);

      // 5ª linha layout: forma pagto(60); banco(5);agencia(10);c/c(15)
      sTexto := '02002'+EspacoaEsq(Trim(qry.FieldByName('FORMAPAGTO').AsString),60)+
                EspacoaEsq(Trim(qry.FieldByName('NUMBANCO').AsString),5)+
                EspacoaEsq(Trim(snomebanco),60)+ 
                EspacoaEsq(Trim(qry.FieldByName('NUMAGENCIA').AsString),10)+
                EspacoaEsq(Trim(qry.FieldByName('CONTACORRENTE').AsString),15);
      ContraCheque.Add(sTexto);

      if aiOpcao = 1 then
      begin
        // 6ª linha layout: logradouro(60);numero(8);complemento(20)
        sTexto := '03001'+EspacoaEsq(Trim(qry.FieldByName('LOGRADOURO').AsString),80)+  //Aline Freire SOL 158705.5441 KINTANA 1345367
                  EspacoaEsq(Trim(qry.FieldByName('NUMERO').AsString),8)+
                  EspacoaEsq(Trim(qry.FieldByName('COMPLEMENTO').AsString),20)+
                  EspacoaEsq(Trim(qry.FieldByName('NUMSEED').AsString),15);
        ContraCheque.Add(sTexto);

        // 7ª linha layout: bairro(20);cidade(60);uf(2);cep(8)
        inc(iLadoPagina);
        sTexto := '03002'+EspacoaEsq(Trim(qry.FieldByName('BAIRRO').AsString),20)+
                  EspacoaEsq(Trim(qry.FieldByName('CIDADE').AsString),60)+
                  EspacoaEsq(Trim(qry.FieldByName('UF').AsString),2)+
                  EspacoaEsq(Trim(qry.FieldByName('CEP').AsString),8)+
                  ZD(inttostr(iLadoPagina),7);
        ContraCheque.Add(sTexto);
      end
      else
      begin
        if iLadoPagina mod 2 = 0 then
        begin
          // 6ª linha layout: logradouro(60);numero(8);complemento(20)
          sendE1:='03001'+EspacoaEsq(Trim(qry.FieldByName('LOGRADOURO').AsString),80)+ //Aline Freire SOL 158705.5441 KINTANA 1345367
                  EspacoaEsq(Trim(qry.FieldByName('NUMERO').AsString),8)+
                  EspacoaEsq(Trim(qry.FieldByName('COMPLEMENTO').AsString),20)+
                  EspacoaEsq(Trim(qry.FieldByName('NUMSEED').AsString),15);

          // 7ª linha layout: bairro(20);cidade(60);uf(2);cep(8)
          inc(iLadoPagina);
          sendE2:='03002'+EspacoaEsq(Trim(qry.FieldByName('BAIRRO').AsString),20)+
                  EspacoaEsq(Trim(qry.FieldByName('CIDADE').AsString),60)+
                  EspacoaEsq(Trim(qry.FieldByName('UF').AsString),2)+
                  EspacoaEsq(Trim(qry.FieldByName('CEP').AsString),8)+
                  ZD(inttostr(iLadoPagina),7);

          sendE3:='03003'+EspacoaEsq(Trim(qry.FieldByName('MATRICULA').AsString),14)+
                  EspacoaEsq(Trim(qry.FieldByName('INSCRICAONUMERO').AsString),14)+
                  EspacoaEsq(Trim(qry.FieldByName('NOMETITULAR').AsString),60);

          sendE4:='03004'+EspacoaEsq(Trim(qry.FieldByName('NOMERECEBEDOR').AsString),60)+
                  EspacoaEsq(Trim(qry.FieldByName('DATANASC').AsString),10)+
                  EspacoaEsq(Trim(qry.FieldByName('ISENTOIRRF').AsString),3)+
                  EspacoaEsq(Trim(qry.FieldByName('NUMDEPIRRF').AsString),3);
        end
        else
        begin
          // 6ª linha layout: logradouro(60);numero(8);complemento(20)
          sendD1:='03001'+EspacoaEsq(Trim(qry.FieldByName('LOGRADOURO').AsString),80)+ //Aline Freire SOL 158705.5441 KINTANA 1345367
                  EspacoaEsq(Trim(qry.FieldByName('NUMERO').AsString),8)+
                  EspacoaEsq(Trim(qry.FieldByName('COMPLEMENTO').AsString),20)+
                  EspacoaEsq(Trim(qry.FieldByName('NUMSEED').AsString),15);

          // 7ª linha layout: bairro(20);cidade(60);uf(2);cep(8)
          inc(iLadoPagina);
          sendD2:='03002'+EspacoaEsq(Trim(qry.FieldByName('BAIRRO').AsString),20)+
                  EspacoaEsq(Trim(qry.FieldByName('CIDADE').AsString),60)+
                  EspacoaEsq(Trim(qry.FieldByName('UF').AsString),2)+
                  EspacoaEsq(Trim(qry.FieldByName('CEP').AsString),8)+
                  ZD(inttostr(iLadoPagina),7);
          sendD3:='03003'+EspacoaEsq(Trim(qry.FieldByName('MATRICULA').AsString),14)+
                  EspacoaEsq(Trim(qry.FieldByName('INSCRICAONUMERO').AsString),14)+
                  EspacoaEsq(Trim(qry.FieldByName('NOMETITULAR').AsString),60);
          sendD4:='03004'+EspacoaEsq(Trim(qry.FieldByName('NOMERECEBEDOR').AsString),60)+
                  EspacoaEsq(Trim(qry.FieldByName('DATANASC').AsString),10)+
                  EspacoaEsq(Trim(qry.FieldByName('ISENTOIRRF').AsString),3)+
                  EspacoaEsq(Trim(qry.FieldByName('NUMDEPIRRF').AsString),3);
        end;
      end;

      iLinha:=0;
      bImprimiu := True; 
      while not (qry.Eof) and
            (iUltTitular = qry.FieldByName('IDTITULAR').AsInteger) and
            (iUltRecebedor = qry.FieldByName('IDRESPONSAVEL').AsInteger) and
            //CONTROLE DE TOTAL DE PAGINAS
            (iLinha < 30) do
      begin
        If bImprimiu Then 
          inc(iLinha);
        // 8ª linha layout: mesref(7);codrubrica(6);descr.rubrica(60);tipo rub(1)=(P/D);vlr rub.(17);vlr assoc.(17)
        // alimenta variáveis
        if qry.FieldByName('TPRUBRICA').AsString = 'P' then
          rResiduo:=0
        else
        begin
          if qry.FieldByName('TPRUBRICA').AsString = 'D' then
              rResiduo:=qry.FieldByName('VALORRECEBIDO').asfloat-
                        qry.FieldByName('VALORPROVENTO').asfloat
          else
              rResiduo := 0;
        end;

        if rResiduo = 0 then
          sinfo:=formatfloat('#0.00',qry.FieldByName('VALORINFO').asfloat)+' (I)'
        else
          sinfo:=formatfloat('#0.00',rResiduo)+' (R)';

        If qry.FieldByName('FLGESPECIAL').AsInteger <> 2 Then
        Begin 
          sTexto := '04'+RightPad(IntToStr(iLinha),3)+
                    EspacoaEsq(Trim(qry.FieldByName('MESREFERENCIA').AsString),7)+
                    EspacoaEsq(Trim(qry.FieldByName('CODPROVDESC').AsString),6)+
                    EspacoaEsq(Trim(qry.FieldByName('IDPROVENTO').AsString),6)+
                    EspacoaEsq(Trim(Copy(qry.FieldByName('DESCRPROVDESC').AsString,1,60)),60)+
                    EspacoaEsq(Trim(qry.FieldByName('TPRUBRICA').AsString),1)+
                    AD(formatfloat('#0.00',qry.FieldByName('VALORPROVENTO').asfloat),15)+
                    AD(sinfo,20);

	  if qry.FieldByName('FLGTIPODESC').asstring = 'E' then
          begin
            if qry.FieldByName('PARCELAS').asinteger > 0 then
              sTexto:=sTexto+
                EspacoaEsq(Trim(
                  inttostr(qry.FieldByName('PARCELAS').asinteger)+'/'+
                  inttostr(qry.FieldByName('PARCELAS').asinteger+
                  qry.FieldByName('VALORINFO').asinteger)),11)
            else
              sTexto:=sTexto+EspacoaEsq('', 11);
          end;

          ContraCheque.Add(sTexto);
          bImprimiu := True; 
        End
        Else
          bImprimiu := False; 

        qry.Next;

	// Insere última linha do titular
        if (iUltTitular <> qry.FieldByName('IDTITULAR').AsInteger) OR (qry.Eof) OR
           (iUltRecebedor <> qry.FieldByName('IDRESPONSAVEL').AsInteger) or
           (iLinha = 30) then
        begin
          sTexto := '05001'+AD(formatfloat('#0.00',rTotProvento),15)+
                  AD(formatfloat('#0.00',rTotDesconto),15)+
                  AD(formatfloat('#0.00',rTotLiquido),15)+
                  AD(formatfloat('#0.00',rTotResiduo),15);
          ContraCheque.Add(sTexto);

	  //CONTROLE DE TOTAL DE PAGINAS
           frmPRelDemPag.mmMSGant.Text := frmPRelDemPag.mmMSG.Text;
          if frmPRelDemPag.CboxSubMsg.Checked  then
              frmPRelDemPag.SubstituiMensagem;
          if (iTotPage > 1) then
            ContraCheque.Add('05002'+'Página '+inttostr(iPageAtual)+' de '+inttostr(iTotPage));
          For iCont := 0 to frmPRelDemPag.mmMSG.lines.Count - 1 do
            ContraCheque.Add('05002'+frmPRelDemPag.mmMSG.Lines.Strings[iCont]);
          frmPRelDemPag.mmMSG.Text := frmPRelDemPag.mmMSGant.Text;
        end;
      end;
      if aiOpcao = 2 then
        ContraCheque.Add(SistemaFolha.SeparadorContraCheque);

      iUltTitular:=qry.FieldByName('IDTITULAR').AsInteger;
      iUltRecebedor:=qry.FieldByName('IDRESPONSAVEL').AsInteger;
      //  mensagem layout: total prov(17);total desc(17);total liq(17);mensagem(60)***VERIFICAR!

      if aiOpcao = 2 then
      begin
        if iLadoPagina mod 2 = 0 then
        begin
          ContraCheque.Add(sendE1);
          ContraCheque.Add(sendE2);
          ContraCheque.Add(sendE3);
          ContraCheque.Add(sendE4);
          ContraCheque.Add(SistemaFolha.SeparadorContraCheque);
          ContraCheque.Add(sendD1);
          ContraCheque.Add(sendD2);
          ContraCheque.Add(sendD3);
          ContraCheque.Add(sendD4);
          ContraCheque.Add(SistemaFolha.SeparadorContraCheque);
        end;
      end;

    end; //for pagina

  end; // while not eof

  if iLadoPagina mod 2 = 1 then
  begin
    ContraCheque.Add(sendE1);
    ContraCheque.Add(sendE2);
    ContraCheque.Add(sendE3);
    ContraCheque.Add(sendE4);
    ContraCheque.Add(SistemaFolha.SeparadorContraCheque);
  end;

 {PARAMETRO TEXTO PARA COLOCAR NO FINAL DO ARQUIVO TEXTO DE CONTRA-CHEQUE}
  if prmRodapeArqCC <> '' then
    ContraCheque.Add(prmRodapeArqCC);
end;

function TContraCheque.EspacoaEsq(Texto: String; Tam: Integer): String;
 var sAux: String;
begin
  sAux:=Texto;
  while length(sAux) < Tam do
    sAux:=sAux+' ';
  Result:=sAux;
end;

procedure TfrmPRelDemPag.VerificaProcessa;
begin
  DeterminaPatroSel;
  DeterminaPlanoSel;
  DeterminaPortforma;
  DeterminaCidades;
  bbtnConfirmar.enabled:=(dblcHistorico.text <> '')and
                         ((sIdCidadesSel <> '')or(cboxCidade.Checked));

  If Not bbtnConfirmar.enabled then
    bbtnConfirmar.enabled:=(dblcHistorico.text <> '') and
                           ((sPatroSel <> '') or (cboxPatro.checked)) and
                           ((sPlanoSel <> '') or (cboxPlano.checked)) and
                           ((sPortformaSel <> '') or (cboxPortforma.checked));
end;

Function TfrmPRelDemPag.MontaQuery(qry: TwwQuery): Boolean;
 var ssql, swhe, sselfixo, sfrom : string;
begin
  Result := True;

  DeterminaPatroSel;
  DeterminaPlanoSel;
  DeterminaPortforma;
  DeterminaCidades;

  swhe:='WHERE H.IDHSTFOLHABENEF = '+
          inttostr(qryHistorico.FieldByName('IDHSTFOLHABENEF').asinteger)+' '+#13#10;

  if sPatroSel <> '' then
  begin
    if pos(',', sPatroSel) = 0 then
      swhe:=swhe+'AND H.IDPATRO = '+sPatroSel+' '+#13#10
    else
      swhe:=swhe+'AND H.IDPATRO in ('+sPatroSel+') '+#13#10;
  end;
  if sPlanoSel <> '' then
  begin
    if pos(',', sPlanoSel) = 0 then
      swhe:=swhe+'AND H.IDPLANOPREV = '+sPlanoSel+' '+#13#10
    else
      swhe:=swhe+'AND H.IDPLANOPREV in ('+sPlanoSel+') '+#13#10;
  end;
  if sPortformaSel <> '' then
  begin
    if pos(',', sPortformaSel) = 0 then
      swhe:=swhe+'AND H.CODPORTFORMA = '+sPortformaSel+' '+#13#10
    else
      swhe:=swhe+'AND H.CODPORTFORMA in ('+sPortformaSel+') '+#13#10;
  end;
  If sIdCidadesSel <> '' then
  begin
    if pos(',', sIdCidadesSel) = 0 then
      swhe:=swhe+'AND CID.IDCIDADES = '+sIdCidadesSel+' '+#13#10
    else
      swhe:=swhe+'AND CID.IDCIDADES in ('+sIdCidadesSel+') '+#13#10;
  end;

  swhe:=swhe+'AND PP.IDPESSOA = H.IDTITULAR '+#13#10+
             'AND PP.IDPLANOPREV = H.IDPLANOPREV '+#13#10+
             'AND PP.IDPESSJUR = H.IDPATRO '+#13#10+
             'AND E.IDPESSOA = H.IDTITULAR '+#13#10+
             'AND E.IDPESSJUR = H.IDPATRO '+#13#10+
             'AND PD.IDPROVENTO = H.IDRUBRICA '+#13#10+
             'AND PL.IDPLANOPREV = H.IDPLANOPREV '+#13#10+
             'AND POF.CODPORTFORMA = H.CODPORTFORMA '+#13#10+
             //FILTRAR ENDEREÇO DE CORRESPONDÊNCIA
             'AND ED.IDPESSOA = H.IDRESPONSAVEL '+#13#10+
             'AND ED.IDENDERECO = RESP.IDENDCORRESP '+#13#10+
             'AND RESP.IDPESSOA = H.IDRESPONSAVEL '+#13#10+
             'AND TIT.IDPESSOA = H.IDTITULAR '+#13#10+
             'AND PF.IDPESSOA = H.IDRESPONSAVEL '+#13#10+
             'AND PAT.IDPESSOA = H.IDPATRO '+#13#10+
             'AND CID.IDCIDADES = ED.IDCIDADES '+#13#10+
             'AND CID.IDESTADO = EST.IDESTADO '+#13#10;

  sselfixo:='H.IDHSTFOLHABENEF, H.DATAPAGAMENTO, H.IDRESPONSAVEL, '+#13#10+
            'E.MATRICULA, PP.INSCRICAONUMERO, H.IDTITULAR, H.IDPESSOA, '+#13#10+
            'PAT.NOME AS PATRO, H.IDPATRO, H.IDPLANOPREV, '+#13#10+
            'PL.NOME AS PLANO, RESP.NOME AS NOMERECEBEDOR, '+#13#10+
            'TIT.NOME AS NOMETITULAR, '+#13#10+
            'PF.DATANASC, PF.NUMDEPIRRF, '+#13#10+
            'DECODE(PF.FLGISENTOIRRF,1,''SIM'',''NÃO'') ISENTOIRRF, '+#13#10+
            'POF.DESCRICAO AS FORMAPAGTO, '+#13#10+
            'H.NUMBANCO, H.NUMAGENCIA, H.CONTACORRENTE, ED.LOGRADOURO, '+#13#10+
            'ED.NUMERO, ED.COMPLEMENTO, ED.BAIRRO, CID.NOME AS CIDADE, '+#13#10+
            'ED.CEP, CID.NUMSEED, EST.CODESTADO AS UF, '+#13#10+
            'NVL(PD.CODPROVDESC, PD.IDPROVENTO) AS CODPROVDESC, '+#13#10+
            'NVL(PD.DESCRPROVDESC, PD.DESCRICAO) AS DESCRPROVDESC, '+#13#10+
            'PD.FLGESPECIAL, '+#13#10+ 
            'DECODE(PD.FLGESPECIAL,0,DECODE(PD.FLGDESCONTO,1,''D'',0,''P'',''I''),''I'') AS TPRUBRICA, '+#13#10+
            'PD.FLGDESCONTO, PD.IDPROVENTO, H.NUMPROCINSS, '+#13#10+
            'H.PARCELAS, H.FLGTIPODESC, '+#13#10+ 
            'H.MESCOBRANCA  '+#13#10; 

  sfrom:='FROM HISTRUBSAL H, PARTPREVPLAN PP, ELEGPATRO E, PROVDESC PD, '+#13#10+
              'PLANPREV PL, PORTADORFORMA POF, PESSOAFISICA PF, ENDPESS ED, '+#13#10+
              'PESSOA RESP, PESSOA TIT, PESSOA PAT, CIDADES CID '+#13#10+
              ', ESTADO EST '+#13#10;

  //CONSIDERAR SEQRUBRICA NA EMISSÃO DO CONTRA-CHEQUE
  ssql:='SELECT G.SEQRUBRICA, G.IDRESPONSAVEL, G.IDHSTFOLHABENEF, G.DATAPAGAMENTO, '+#13#10+
               'G.MESREFERENCIA, G.MATRICULA, G.INSCRICAONUMERO, G.IDTITULAR, '+#13#10+
               'G.PATRO, G.IDPATRO, G.IDPLANOPREV, '+#13#10+
               'G.PLANO, G.NOMERECEBEDOR, G.NOMETITULAR, '+#13#10+
               'G.DATANASC, G.NUMDEPIRRF, G.ISENTOIRRF, G.FORMAPAGTO, '+#13#10+
               'G.NUMBANCO, G.NUMAGENCIA, G.CONTACORRENTE, G.LOGRADOURO, '+#13#10+
               'G.NUMERO, G.COMPLEMENTO, G.BAIRRO, G.CIDADE, '+#13#10+
               'G.CEP, G.NUMSEED, G.UF, G.CODPROVDESC, G.DESCRPROVDESC, '+#13#10+
               'G.TPRUBRICA, G.FLGDESCONTO, G.IDPROVENTO, G.NUMPROCINSS, '+#13#10+
               'G.FLGESPECIAL, '+#13#10+
               'G.IDPESSOA, G.MESCOBRANCA, '+#13#10+
               'G.PARCELAS, G.FLGTIPODESC, '+#13#10+ 
               'SUM(G.VALORINFO) VALORINFO, SUM(G.VALORRECEBIDO) VALORRECEBIDO, '+#13#10+
               'SUM(G.VALORPROVENTO) VALORPROVENTO '+#13#10+
        'FROM (SELECT H.SEQRUBRICA, H.MES AS MESREFERENCIA, '+#13#10+
                     'H.VALORINFO, H.VALORRECEBIDO, H.VALORPROVENTO, '+#13#10+
        sselfixo+
        sfrom+
        swhe+
        'AND NVL(PD.FLGAGRUPA,0) = 0 '+#13#10+
        'UNION '+#13#10+
	       'SELECT MIN(H.SEQRUBRICA) AS SEQRUBRICA, '+#13#10+#13#10+
             	 'MAX(H.MES) AS MESREFERENCIA, '+#13#10+
			            'SUM(H.VALORINFO) AS VALORINFO, '+#13#10+
			            'SUM(H.VALORRECEBIDO) AS VALORRECEBIDO, '+#13#10+
           			 'SUM(H.VALORPROVENTO) AS VALORPROVENTO, '+#13#10+
        sselfixo+
        sfrom+
        swhe+
        'AND NVL(PD.FLGAGRUPA,0) = 1 '+#13#10+
        'GROUP BY H.IDHSTFOLHABENEF, H.DATAPAGAMENTO, '+#13#10+
	 		             'H.IDRESPONSAVEL, E.MATRICULA, PP.INSCRICAONUMERO, '+#13#10+
                 'H.IDTITULAR, H.IDPESSOA, PAT.NOME, H.IDPATRO, H.IDPLANOPREV, '+#13#10+
                 'PL.NOME, RESP.NOME, TIT.NOME, PF.DATANASC, PF.NUMDEPIRRF, '+#13#10+
                 'PF.FLGISENTOIRRF, POF.DESCRICAO, H.NUMBANCO, H.NUMAGENCIA, '+#13#10+
                 'H.CONTACORRENTE, ED.LOGRADOURO, ED.NUMERO, ED.COMPLEMENTO, '+#13#10+
                 'ED.BAIRRO, CID.NOME, ED.CEP, CID.NUMSEED, EST.CODESTADO, '+#13#10+
                 'PD.IDFUNDACAO, PD.CODPROVDESC, PD.IDPROVENTO, PD.DESCRPROVDESC, '+#13#10+
                 'PD.DESCRICAO, PD.FLGESPECIAL,PD.FLGDESCONTO, PD.IDPROVENTO, '+#13#10+
                 'H.PARCELAS, H.FLGTIPODESC, '+#13#10+ 
			              'H.NUMPROCINSS, H.MESCOBRANCA '+#13#10+
             ') G '+#13#10+
             'GROUP BY G.IDRESPONSAVEL, G.IDHSTFOLHABENEF, G.SEQRUBRICA, G.DATAPAGAMENTO, '+#13#10+
                      'G.MESREFERENCIA, G.MATRICULA, G.INSCRICAONUMERO, '+#13#10+
                      'G.IDTITULAR, G.PATRO, G.IDPATRO, G.IDPLANOPREV, G.PLANO, '+#13#10+
                      'G.NOMERECEBEDOR, G.NOMETITULAR, G.DATANASC, G.NUMDEPIRRF, '+#13#10+
                      'G.ISENTOIRRF, G.FORMAPAGTO, G.NUMBANCO, G.NUMAGENCIA, '+#13#10+
                      'G.CONTACORRENTE, G.LOGRADOURO, G.NUMERO, G.COMPLEMENTO, '+#13#10+
                      'G.BAIRRO, G.CIDADE, G.CEP, G.NUMSEED, G.UF, G.CODPROVDESC,  '+#13#10+
                      'G.DESCRPROVDESC, G.TPRUBRICA, G.FLGDESCONTO, G.IDPROVENTO, G.NUMPROCINSS, '+#13#10+
                      'G.FLGESPECIAL, '+#13#10+
                      'G.PARCELAS, G.FLGTIPODESC, '+#13#10+ 
                      'G.IDPESSOA, G.MESCOBRANCA '+#13#10+ 
             'ORDER BY NUMSEED, CEP, INSCRICAONUMERO, G.IDRESPONSAVEL, SEQRUBRICA'+#13#10;

  qry.Sql.Clear;
  qry.Sql.Add(ssql);
  qry.Open;
  if qry.IsEmpty then
  begin
    MsgDlg('Não existem pessoas para Emissão de Contra Cheque com as opções '+
           'selecionadas','Erro',mtError,[mbOk,mbHelp],0);
    bbtnConfirmar.Enabled:=False;
    Result := False;
  end;
end;

procedure TfrmPRelDemPag.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ContraCheque.Free;
  ListaPatro.free;
  ListaPlano.free;
  ListaPortforma.free;
  ListaCidades.free;
end;

procedure TfrmPRelDemPag.dblcHistoricoChange(Sender: TObject);
begin
  inherited;
  cboxCidade.Checked:=False;
  cboxPatro.checked:=False;
  cboxPlano.checked:=False;
  cboxPortForma.checked:=False;
  If StrToIntDef(dblcHistorico.LookupValue,0)>0 then
  begin
    MontaListaPatro;
    MontaListaPlano;
    MontaListaPortforma;
    MontaListaCidades;
    cboxPatro.Enabled:=(chklstPatro.Items.Count>0);
    cboxPlano.Enabled:=(chklstPlano.Items.Count>0);
    cboxPortForma.Enabled:=(chklstPortForma.Items.Count>0);
    cboxCidade.Visible:=(chklstPatro.Items.Count>0)And
                         (chklstPlano.Items.Count>0)And
                          (chklstPortForma.Items.Count>0);

    VerificaProcessa;
  end;
end;

procedure TfrmPRelDemPag.cboxPatroClick(Sender: TObject);
begin
  inherited;
  if (activecontrol = sender) then
  begin
    If chklstPatro.ItemIndex>=0 then
      MarcaLista(chklstPatro, cboxPatro.checked);
    VerificaProcessa;
  end;  
end;

procedure TfrmPRelDemPag.cboxPlanoClick(Sender: TObject);
begin
  inherited;
  if (activecontrol = sender) then
  begin
    If chklstPlano.ItemIndex>=0 then
      MarcaLista(chklstPlano, cboxPlano.checked);
    VerificaProcessa;
  end;  
end;

procedure TfrmPRelDemPag.cboxPortformaClick(Sender: TObject);
begin
  inherited;
  if (activecontrol = sender) then
  begin
    If chklstPortForma.ItemIndex>=0 then
      MarcaLista(chklstPortforma, cboxPortforma.checked);
    VerificaProcessa;
  end;
end;

procedure TfrmPRelDemPag.chklstPatroClickCheck(Sender: TObject);
begin
  inherited;
  cboxPatro.checked:=VerificaLista(chklstPatro);
end;

procedure TfrmPRelDemPag.chklstPlanoClickCheck(Sender: TObject);
begin
  inherited;
  cboxPlano.checked:=VerificaLista(chklstPlano);
end;

procedure TfrmPRelDemPag.chklstPortformaClickCheck(Sender: TObject);
begin
  inherited;
  cboxPortforma.checked:=VerificaLista(chklstPortforma);
end;

procedure TfrmPRelDemPag.chklstPatroClick(Sender: TObject);
begin
  inherited;
  VerificaProcessa;
end;

procedure TfrmPRelDemPag.chklstPlanoClick(Sender: TObject);
begin
  inherited;
  VerificaProcessa;
end;

procedure TfrmPRelDemPag.chklstPortformaClick(Sender: TObject);
begin
  inherited;
  VerificaProcessa;
end;

procedure TfrmPRelDemPag.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  dlgArquivo.filename:=lblSalvar.caption;
  dlgArquivo.InitialDir:=ExtractFilePath(lblSalvar.caption);
  if dlgArquivo.execute then
    lblSalvar.caption:=dlgArquivo.filename;
end;

procedure TfrmPRelDemPag.cboxCidadeClick(Sender: TObject);
begin
  inherited;
  if (activecontrol = sender) then
  begin
    If chklstCidade.ItemIndex>=0 then
      MarcaLista(chklstCidade, cboxCidade.checked);
    VerificaProcessa;
  end;
end;

procedure TfrmPRelDemPag.chklstCidadeClickCheck(Sender: TObject);
begin
  inherited;
  cboxCidade.checked:=VerificaLista(chklstCidade);
end;

procedure TfrmPRelDemPag.chklstCidadeClick(Sender: TObject);
begin
  inherited;
  VerificaProcessa;
end;

procedure TfrmPRelDemPag.SubstituiMensagem;
var
 sValorRegra : String;
 idRegra : String;
 TipoRegra : Integer;
 Msg : String;
 SsQL :  String;
 lbErro : Boolean;
 bRespostas : Boolean;
 iIdCalculoGeral : integer;
 FlagTem : Integer;
 MesProximo1 : Integer;
 MesProximo2 : String;
 anoProximo : Integer;
 MesproxPag : String;
begin
 if qryMSG.Active  then
    qryMSG.Close;
  qryMSG.Open;
  FlagTem := 0;
  AnoProximo := StrToInt(Copy(MesProximo,1,4));
  MesProximo1 :=  sTrToInt(Copy(MesProximo,6,2)) + 1 ;
  if MesProximo1 > 12 then
     begin
        MesProximo1 := 1;
        AnoProximo := AnoProximo + 1;
     end;
   MesProximo2 := IntToStr(MesProximo1);
    if MesProximo2 =   '1' then  MesProximo2 := '01';
    if MesProximo2 =   '2' then  MesProximo2 := '02';
    if MesProximo2 =   '3' then  MesProximo2 := '03';
    if MesProximo2 =   '4' then  MesProximo2 := '04';
    if MesProximo2 =   '5' then  MesProximo2 := '05';
    if MesProximo2 =   '6' then  MesProximo2 := '06';
    if MesProximo2 =   '7' then  MesProximo2 := '07';
    if MesProximo2 =   '8' then  MesProximo2 := '08';
    if MesProximo2 =   '9' then  MesProximo2 := '09';

    MesproxPag := IntToStr(anoProximo) + '/' + MesProximo2;
    IF  qryCalendatas.Active then
         qryCalendatas.Close;
    qryCalendatas.ParamByName('ANOMESREF').AsString := MesproxPag;
    qryCalendatas.Open;
    IF qryCalendatas.Eof then
       dtproxpag := Date
    else
       dtproxpag := qryCalendatas.FieldByName('DATAPAGBENEF').AsDateTime;
 while not qryMSG.eof do
  begin
  idRegra := inttostr(qryMSG.FieldByName('IDREGRA').AsInteger);
  TipoRegra := qryMSG.FieldByName('FLGTIPOREGRA').AsInteger;
  Msg := qryMSG.FieldByName('MSG').AsString;

  ssql := 'SELECT '+
               inttostr(inumdepirrf)+' AS NUMDEPIRRF, '+
               QuotedStr(formatdatetime('dd/mm/yyyy',dtdatanasc))+' AS DATANASC, '+
               QuotedStr(formatdatetime('dd/mm/yyyy',dtproxpag))+' AS DATAPROX1, '+
               Floattostr(prmVLMINIRFF)+' AS VLMINIR, '+
               InttoStr(iidtitular)+' AS IDTITULAR, '+
               IntToStr(iidpatro)+' AS IDPESSJUR, '+
               inttostr(iidplanoprev)+' AS IDPLANOPREV, '+
               inttostr(iIdbeneficio)+' AS IDBENEFICIO, '+
               inttostr(iidresponsavel)+ ' AS IDPESSOA ';
  ssql := ssql + ' FROM DUAL ';
     if TipoRegra = 0 Then
       begin
         try
            sValorRegra:=RegraNumerica(
             idRegra,sSQL, lbErro, iIdCalculoGeral);
          except
             sValorRegra := '0';
          end;
          if (sValorRegra <> '') 
           and (not lbErro) then
               begin
               if FlagTem = 0 then
                 begin
                  mmMSG.Clear;
                  FlagTem := 1;
                 end;
                 msg := msg + sValorRegra;
                 mmMSG.Lines.Add(msg);
               end;
       end
       else begin
           try

               bRespostas:=RegraBooleana
              (idRegra ,sSQL , lbErro);
           except
              bRespostas := False;
           end;
          if bRespostas then
              if FlagTem = 0 then
                 begin
                  mmMSG.Clear;
                  FlagTem := 1;
                 end;
              mmMSG.Lines.Add(msg);
       end;

  qryMsg.Next;
  end;
end;

end.
{==============================================================================|
| UNIT: FPRELDEMPAG                                                            |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   GERA ARQUIVO TEXTO PARA EMISSÃO DE CONTRA CHEQUE COM INFORMAÇÕES DAS       |
| RUBRICAS DE PAGAMENTO DOS RECEBEDORES DE DETERMINADA VERSÃO DE PAGAMENTO,    |
| PODENDO UTILIZAR FILTRO POR PATROCINADORA, PLANO E PORTADOR FORMA.           |
| PODE-SE TAMBÉM DEFINIR UMA MENSAGEM A SER IMPRESSA NO CONTRA CHEQUE.         |
|==============================================================================|

 LAYOUT DO ARQUIVO TEXTO

+-------+----------------------+---------+----------------+--------------------+
| Linha | Descrição            | Formato | Valor do Campo | Tipo de Informação |
+-------+----------------------+---------+----------------+--------------------+
|    01 | Faixa de controle    | A02     |             01 | Dados do Titular   |
|       | Numero Linha Faixa   | A03     |            001 |                    |
|       | Mes Pagamento	       | A07     |                |                    |
|       | Versao Folha         | A08     |                |                    |
|       | Data do Crédito      | A10     |                |                    |
|       | No. Proc INSS	       | A15     |                |                    |
+-------+----------------------+---------+----------------+--------------------+
|    02 | Faixa de controle    | A02     |             01 | Dados do Titular   |
|       | Numero Linha Faixa   | A03     |            002 |                    |
|       | Matricula            | A14     |                |                    |
|       | Inscrição            | A14     |                |                    |
|       | Nome Titular         | A60     |                |                    |
|       | Nº Seq. do Dependente| A02     |                |                    |
+-------+----------------------+---------+----------------+--------------------+
|    03 | Faixa de controle    | A02     |             01 | Dados do Titular   |
|       | Numero Linha Faixa   | A03     |            003 |                    |
|       | Patrocinadora	       | A60     |                |                    |
|       | Plano	               | A60     |                |                    |
|       | Valor Base 1         | N15.8   |                |                    |
|       | Valor do SRB         | N15.2   |                |                    |
|       | Valor do Inss        | N15.2   |                |                    |
+-------+----------------------+---------+----------------+--------------------+
|    04 | Faixa de controle    | A02     |             02 | Dados do Recebedor |
|       | Numero Linha Faixa   | A03     |            001 |                    |
|       | Nome Recebedor       | A60     |                |                    |
|       | Data Nascimento      | A10     |                |                    |
|       | Isento IR            | A03     |      SIM e NÃO |                    |
|       | Numero Dependentes IR| A03     |                |                    |
|       | Perc. Rateio Pension.| N15.8   |                |                    |
|       | Matríc. Beneficiário | A14     |                |                    |
+-------+----------------------+---------+----------------+--------------------+
|    05 | Faixa de controle    | A02     |             02 | Dados do Recebedor |
|       | Numero Linha Faixa   | A03     |            002 |                    |
|       | Forma de Pagamento   | A60     |                |                    |
|       | Banco                | A05     |                |                    |
|       | Nome do Banco        | A60     |                |                    |
|       | Agencia              | A10     |                |                    |
|       | Conta corrente       | A15     |                |                    |
+-------+----------------------+---------+----------------+--------------------+
|    06 | Faixa de controle    | A02     |             03 | Endereco de        |
|       | Numero Linha Faixa   | A03     |            001 | correnpondência    |
|       | Logradouro           | A60     |                |                    |
|       | Numero               | A08     |                |                    |
|       | Complemento          | A20     |                |                    |
|       | SEED                 | A15     |                |                    |
+-------+----------------------+---------+----------------+--------------------+
|    07 | Faixa de controle    | A02     |             03 | Endereco de        |
|       | Numero Linha Faixa   | A03     |            002 | correnpondência    |
|       | Bairro               | A20     |                |                    |
|       | Cidade               | A60     |                |                    |
|       | UF                   | A02     |                |                    |
|       | CEP                  | A08     |                |                    |
|       | Seqüencial           | A07     |                |                    |
+-------+----------------------+---------+----------------+--------------------+
|    08 | Faixa de controle    | A02     |             03 | Dados do Titular   |
|       | Numero Linha Faixa   | A03     |            003 |                    |  apenas para 2
|       | Matricula            | A14     |                |                    |  contra cheques
|       | Inscrição            | A14     |                |                    |  por página
|       | Nome Titular         | A60     |                |                    |
+-------+----------------------+---------+----------------+--------------------+
|    09 | Faixa de controle    | A02     |             03 | Dados do Recebedor |  apenas para 2
|       | Numero Linha Faixa   | A03     |            004 |                    |  contra cheques
|       | Nome Recebedor       | A60     |                |                    |  por página
+-------+----------------------+---------+----------------+--------------------+
|10 a nn| Faixa de controle    | A02     |             04 | Dados das Rubricas |
|       | Numero Linha Faixa   | A03     |      001 a nnn |                    |
|       | Mês de referência    | A07     |                |                    |
|       | Cód. da rub. Interno | A06     |                |                    |
|       | Cód. da rub. Externo | A06     |                |                    |
|       | Descrição da rubrica | A60     |                |                    |
|       | Tipo da rubrica      | A01     |P=prov.;D=desc. |                    |
|       | Valor da rubrica     | N15.2   |                |                    |
|       | Valor associado      | A20     | Valor+(I)ou(R) |                    |
|       | Parcela da Rubrica   | A11     | nnnnn/nnnnn    |                    |
+-------+----------------------+---------+----------------+--------------------+
|  nn+1 | Faixa de controle    | A02     |             05 | Totalização        |
|       | Numero Linha Faixa   | A03     |            001 |                    |
|       | Total Proventos      | N15.2   |                |                    |
|       | Total Descontos      | N15.2   |                |                    |
|       | Total Líquido        | N15.2   |                |                    |
|       | Total do Resíduo     | N15.2   |                |                    |
+-------+----------------------+---------+----------------+--------------------+
|  nn+2 | Faixa de controle    | A02     |             05 | 4 linhas de        |
|       | Numero Linha Faixa   | A03     |            002 | mensagens          |
|       | Mensagens            | A60     |                |                    |
+-------+----------------------+---------+----------------+--------------------+

|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/02/2002 A 18/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12c                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ORDENAÇÃO DOS REGISTROS NO ARQUIVO TEXTO PELO NÚMERO DE SEED (CONTRATO COM |
| O CORREIO).                                                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/03/2002 A 26/03/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12e                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - IMPLEMENTA 2 CONTRA-CHEQUES POR PAGINA USANDO PARAMETRO PARA IDENTIFICAR   |
| MODELO EM 1 OU 2 CONTRA CHEQUES POR PAG E NO CASO DO SEGUNDO TEXTO SEPARADOR |
| ENTRE OS CONTRA CHEQUES.                                                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/05/2002 A 22/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12u                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - FAZER JOIN DA PESSOAFISICA COM O RESPONSAVEL E NÃO O TITULAR PARA PEGAR    |
| DADOS DE N.DEP IRRF E ISENÇÃO IRRF DO RESPONSAVEL.                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/06/2002 A 10/06/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13                                               |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO NA GERAÇÃO DO CONTRA-CHEQUE PARA QUEBRAR O CONTRA CHEQUE EM VA-  |
| RIAS PAGINAS.                                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: SIDNEI B MARINS                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/06/2002 A 11/02/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: OPÇÃO DE GERAÇÃO POR CIDADE.                     |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/07/2002 A 31/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Busca de mais cinco campos, colocando mais queries. Caso o contra-cheque  |
|  for de 2 por página, imprime esses campos no arquivo, senão não serão usados|
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/10/2002 A 08/10/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Acerto na marcação dos itens das listas. Quando todos os itens estavam     |
| marcados, e se tenta desmarcar um item, todos os itens devem ser desmarcados.|
| Pendência 9623                                                               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Ricardo Vigorito                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/02/2004 A 11/02/2004                         |
| PENDÊNCIA: 15085                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  Foi criado um rotina de geração de mensagens automáticas                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03/05/2004 A 03/05/2004                         |
| PENDÊNCIA: 16679                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.11e                                              |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO NO CADASTRO DO FLGAGRUPA PARA PERMITIR O AGRUPAMENTO DOS VALORES  |
| POR RUBRICA NO CONTRACHEQUE. QUERY PRINCIPAL ALTERADA.                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/08/2004 A 28/08/2004                         |
| PENDÊNCIA: 17803                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Não utilizar mais CMINTBANCO em 2 camadas e substituir a unit uBiblioteca    |
| pela uString.                                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 30/05/2007 A 30/05/2007                         |
| PENDÊNCIA: 25503                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.05.14p                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAMOS NO REGISTRO 2 O NÚMERO DA SEQUÊNCIA DO DEPENDENTE DA DEPENTIT.   |
|                                                                              |
|------------------------------------------------------------------------------}


