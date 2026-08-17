{
-----------------------------------------------------------------------------
Nº SOL......: 235849
Nº PPM......: 459943
Data........: 23/07/2014
Responsável.: Paulo Nobre SOL 235849 PPM 459943
Descrição...: Ajuste na baixa automatica
-----------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: - Integração com o Planejamento Orçamentário
-----------------------------------------------------------------------------
}
{=======================================================================================
Autor       : Bruno Bastos
Data        : 08/02/2010
Sol_Kintana : 130745_735881
Descrição   : Passar a data programada dos documentos filhos no lugar da data de baixa.
{=======================================================================================
Autor     : Marcus Oliveira
Data      : 14/08/2007
Pendência : 26020
Descrição : Criado uma crítica, na baixa automatica para o portador conta inativo. 
{=======================================================================================
Autor     : Marcus Oliveira
Data      : 12/04/2007
Pendência : 24823
Descrição : Ativa o portadorconta
{=======================================================================================
Autor     : Marcus Oliveira
pendência : 24309
Data      : 07.03.2007
Descrição : Gravar uma observação no histórico ao fazer a baixa de documento automatica
========================================================================================

{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ -  Baixa Automática de Títulos                        } 
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 16/09/2002                             }
{                                                       }
{*******************************************************}

unit FBaixaAutomaticaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, fOkCancelar, Buttons, TB97Tlbr, TB97, ExtCtrls,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, StdCtrls, CmParamReport, DBClient,
  uCMClientDataSet, uCmSqlParams, Wwdatsrc, MAHlpBtn, ActnList, ImgList,
  uCtrlBaixaRecXPag, //Bruno Bastos - Sol 126261 - 16/12/2009
  uCtrlBaixaDocumentos, Db;

CONST
  SQLLOTESVAZIOS = ' SELECT DISTINCT ' +
                   '    LOTEPAGTO.NUMLOTE, ' +
                   '    PF.DESCRICAO, ' +
                   '    LOTEPAGTO.DATAEMISSAO, ' +
                   '    LOTEPAGTO.FAVORECIDO, ' +
                   '    LOTEPAGTO.NUMCHQBORDERO, ' +
                   '    LOTEPAGTO.CODPORTFORMA, ' +
                   '    SUM(LOTEX.VALOR), ' +
                   '    LOTEPAGTO.PLNCODIGO ' +
                   ' FROM ' +
                   '    LOTEPAGTO, ' +
                   '    LOTEXDOCUM ' +
                   '    LOTEX, ' +
                   '    DOCUMENTO DOC, ' +
                   '    PORTADORFORMA PF ' +
                   ' WHERE ' +
                   '    1=2 ' +
                   ' GROUP BY ' +
                   '    LOTEPAGTO.NUMLOTE, ' +
                   '    PF.DESCRICAO, ' +
                   '    LOTEPAGTO.DATAEMISSAO, ' +
                   '    LOTEPAGTO.FAVORECIDO, ' +
                   '    LOTEPAGTO.NUMCHQBORDERO, ' +
                   '    LOTEPAGTO.CODPORTFORMA, ' +
                   '    LOTEPAGTO.PLNCODIGO ' +
                   ' ORDER BY ' +
                   '    LOTEPAGTO.NUMLOTE';

type
  TFrmBaixaAutomaticaMT = class(TfrmOkCancelar)
    Panel1: TPanel;
    LblDocPagos: TPanel;
    Panel5: TPanel;
    DbGrdDestino: TwwDBGrid;
    LbldocEscluidos: TPanel;
    DsPend: TwwDataSource;
    DsSel: TwwDataSource;
    DbGrdOrigem: TwwDBGrid;
    CmpSelLotePagto: TCmParamReport;
    SqlPend: TCMSqlParams;
    CdsPend: TCMClientDataSet;
    SqlSel: TCMSqlParams;
    CdsSel: TCMClientDataSet;
    CdsDocXPortForma: TCMClientDataSet;
    SQLDocXPortForma: TCMSqlParams;
    Panel4: TPanel;
    BtnAdicioinar: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnProcurar: TBitBtn;
    Splitter1: TSplitter;
    ImlBaixa: TImageList;
    ActBaixaAutomatica: TActionList;
    ActAdicionar: TAction;
    ActExclui: TAction;
    cmpPagAutomatico: TCmParamReport;
    sqlPortConta: TCMSqlParams;
    cdsPortconta: TCMClientDataSet;
    SqlDocsFilhoPag: TCMSqlParams;
    SqlDocsFilhoRec: TCMSqlParams;
    CdsDocsFilhoPag: TCMClientDataSet;
    CdsDocsFilhoRec: TCMClientDataSet;
    cdsAux: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure DbGrdOrigemCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure BtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure ActBaixaAutomaticaUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure ActAdicionarExecute(Sender: TObject);
    procedure ActExcluiExecute(Sender: TObject);
    procedure CdsPendAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    BaixaDocumentos: TCtrlBaixaDocumentos;

    //Bruno Bastos - Sol 126261 - Início
    BaixaRecXPag       : TCtrlBaixaRecXPag;
    //Bruno Bastos - Sol 126261 - Fim

    procedure SelFaixaLotes(bVazio: Boolean = False);
  public
    { Public declarations }
  end;
                                                             
var
  FrmBaixaAutomaticaMT: TFrmBaixaAutomaticaMT;

implementation

uses uSistema, uMensErro, uCtrlParamIntegra, uCmDialogs, uDataBase, uModulo, uCtrlDocumento;

{$R *.DFM}


procedure TFrmBaixaAutomaticaMT.SelFaixaLotes(bVazio: Boolean = False);
var
  bSelecionaData, bSelecionaPortForma: Boolean;

  procedure LimpaGrids;
  Begin
    SqlPend.Sql.Text := SQLLOTESVAZIOS;
    SqlPend.Open;

    SqlSel.Sql.Text := SQLLOTESVAZIOS;
    SqlSel.Open;
  End;

begin
  LimpaGrids;

  If Not bVazio Then
  Begin
     bSelecionaData := (Not CmpSelLotePagto.ParamValues[1].IsNull) and  (Not CmpSelLotePagto.ParamValues[2].IsNull);
     bSelecionaPortForma := Not CmpSelLotePagto.ParamValues[0].IsNull;

     If (Not bSelecionaData) And (Not bSelecionaPortForma) And
        (MsgDlg('Não foram selecionado(s) filtro(s) para a seleção dos lotes,' + (#13+#10) + 'por isso a sua pesquisa pode demorar a ser exibida. Deseja Continuar ?','Atenção',mtConfirmation, [mbYes,mbNo],0) = mrNo) then Exit;

     With SqlPend, Sql Do
     Begin
        Clear;
        Add(' SELECT DISTINCT ');
        Add('   LOTEPAGTO.NUMLOTE, ');
        Add('   PORTADORFORMA.DESCRICAO, ');
        Add('   LOTEPAGTO.DATAEMISSAO,  ');
        Add('   LOTEPAGTO.FAVORECIDO, ');
        Add('   LOTEPAGTO.NUMCHQBORDERO, ');
        Add('   LOTEPAGTO.CODPORTFORMA, ');
        Add('   SUM(LOTEX.VALOR), ');
        Add('   LOTEPAGTO.PLNCODIGO ');
        Add(' FROM ');
        Add('   DOCUMENTO DOC, ');
        Add('   LOTEPAGTO, ');
        Add('   LOTEXDOCUM LOTEX, ');
        Add('   (SELECT ');
        Add('       COUNT(*) AS TOTDOCUM, ');
        Add('       LP.NUMLOTE ');
        Add('    FROM ');
        Add('       DOCUMENTO D, ');
        Add('       LOTEPAGTO LP, ');
        Add('       LOTEXDOCUM LD ');
        Add('    WHERE ');
        Add('       (D.RECPAG = :RECPAG)  AND ');

        If bSelecionaData then
           Add(' ( LP.DATAEMISSAO BETWEEN :DATAINI AND :DATAFIN ) AND ');
        Add('       (LP.NUMLOTE = LD.NUMLOTE ) AND ');
        Add('       (LD.CODDOCUMENTO = D.CODDOCUMENTO) ');
        Add('    GROUP BY ');
        Add('       LP.NUMLOTE) TOTDOCUM, ');
        Add('   (SELECT ');
        Add('       COUNT(*) AS TOTDOCUM , ');
        Add('       LP.NUMLOTE ');
        Add('    FROM ');
        Add('       DOCUMENTO D, ');
        Add('       LOTEPAGTO LP, ');
        Add('       LOTEXDOCUM LD ');
        Add('    WHERE ');
        Add('       (D.RECPAG = :RECPAG) AND ');

        If bSelecionaData then
           Add(' ( LP.DATAEMISSAO BETWEEN :DATAINI AND :DATAFIN ) AND ');

        Add('       ( LP.NUMLOTE = LD.NUMLOTE ) AND ');
        Add('       (LD.CODDOCUMENTO = D.CODDOCUMENTO) ');
        Add('    GROUP BY ');
        Add('       LP.NUMLOTE  ) TOTLOTE , ');
        Add('    PORTADORFORMA ');
        Add(' WHERE ');
        Add('    (FLAGEMISSAO = ''1'') AND ');
        Add('    (FLAGCANCEL IS NULL OR FLAGCANCEL = '' '') AND ');
        Add('    (LOTEPAGTO.CODPORTFORMA = PORTADORFORMA.CODPORTFORMA) AND ');
        Add('    (TOTLOTE.TOTDOCUM = TOTDOCUM.TOTDOCUM) AND ');
        Add('    (TOTLOTE.NUMLOTE = TOTDOCUM.NUMLOTE) AND ');
        Add('    (TOTLOTE.NUMLOTE = LOTEPAGTO.NUMLOTE) AND ');

        If bSelecionaPortForma Then
           Add(' (LOTEPAGTO.CODPORTFORMA = :CODPORTFORMA) AND ');

        If bSelecionaData Then
           Add(' (LOTEPAGTO.DATAEMISSAO BETWEEN :DATAINI AND :DATAFIN) AND ');

        Add('        DOC.IDPESSOA = :IDPESSOA AND ');
        Add('        DOC.RECPAG = :RECPAG AND ');
        Add('        LOTEPAGTO.NUMLOTE = LOTEX.NUMLOTE AND ');
        Add('        LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO AND ');
        Add('        ((LOTEX.FLGBAIXA  IN (''N'',''R''))  OR (LOTEX.FLGBAIXA IS NULL)) ');
        Add('GROUP BY LOTEPAGTO.NUMLOTE,PortadorForma.DESCRICAO, LOTEPAGTO.DATAEMISSAO, ');
        Add('         LOTEPAGTO.FAVORECIDO, LOTEPAGTO.NUMCHQBORDERO, LOTEPAGTO.CODPORTFORMA, LOTEPAGTO.PLNCODIGO ');

        Prepare;
        ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
        ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

        If bSelecionaPortForma Then
           ParamByName('CODPORTFORMA').AsInteger := CmpSelLotePagto.ParamValues[0].AsInteger;

        If bSelecionaData Then
        Begin
           ParamByName('DATAINI').AsDate := CmpSelLotePagto.ParamValues[1].AsDateTime;
           ParamByName('DATAFIN').AsDate := CmpSelLotePagto.ParamValues[2].AsDateTime;
        End;

        Open;
     End;
  End;
End;

procedure TFrmBaixaAutomaticaMT.FormCreate(Sender: TObject);
begin
  inherited;

  BaixaDocumentos := TCtrlBaixaDocumentos.Create;
  BaixaDocumentos.InitializeAs(ParamIntegra);

  //Bruno Bastos - Sol 126261 - Início
  BaixaRecXPag := TCtrlBaixaRecXPag.Create;
  BaixaRecXPag.InitializeAs(ParamIntegra);
  //Bruno Bastos - Sol 126261 - Fim

  CmpSelLotePagto.ParamValues[0].LookupSettings.SQL.Text :=
     ' SELECT DESCRICAO,CODPORTFORMA, DMAIS, LANCAFINANC, PLANO, PLACONTA,  PLACONTACONTABCHQ, PLANOCONTABCHQ, FLGCONTABEMISCHQ  ' +
     ' FROM PORTADORFORMA ' +
     ' WHERE RECPAG = ''' + ParamIntegra.RecPag + '''  '  +
     ' AND NVL(FLGENCCONTAS, ''N'') = ''N'' '+  //pendência 22486 - 21486 - 21/11/2006
     ' AND NVL(FLGATIVO, ''S'') = ''S'' ' +

     ' AND PORTADORFORMA.IDPESSOA='  +IntToStr(Sistema.idEmpresa) + ' ORDER BY DESCRICAO';

  SelFaixaLotes(True);

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30031;
    bbtnAjuda.HelpContext := 30031;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;
                                                         
procedure TFrmBaixaAutomaticaMT.DbGrdOrigemCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if Field.FieldName='SUM(LOTEX.VALOR)' then
    begin
      AFont.Color:=clNavy;
      ABrush.Color:=$0080FFFF;{Amarelo claro}
    end;
end;

procedure TFrmBaixaAutomaticaMT.BtnProcurarClick(Sender: TObject);
begin
  inherited;
  If CmpSelLotePagto.Execute Then SelFaixaLotes;
end;

procedure TFrmBaixaAutomaticaMT.bbtnConfirmarClick(Sender: TObject);
Var
  dDataBaixa: TDateTime;

  function GetFaixaLotes: String;
  Var
     sFaixa: String;
  Begin
      sFaixa := '';

      CdsSel.First;
      While Not CdsSel.Eof Do
      Begin
           sFaixa := sFaixa + CdsSel.FieldByName('NUMLOTE').AsString + ',';
           CdsSel.Next;
      end;
      Result := '(' +  Copy(sFaixa,1,Length(sFaixa)-1) + ')';
  end;

  function MontaSqlDocs: Boolean;
  Var
   sFaixaLotes: String;
   rValor: Real;
   bFiltraData: Boolean;
  Begin
    Result := False;

    sFaixaLotes := GetFaixaLotes;

    bFiltraData := (Not CmpSelLotePagto.ParamValues[1].IsNull) and  (Not CmpSelLotePagto.ParamValues[2].IsNull);

    With SQLDocXPortForma, Sql Do
    Begin
       Clear;
       Add(' SELECT ');
       Add('    PORT.DESCRICAO, ');
       Add('    LOTEX.VALOR AS VALOR, ');
       Add('    PESS.RAZAOSOCIAL AS NOME, ');
       Add('    LOTEP.CODPORTFORMA, ');
       Add('    LOTEP.NUMCHQBORDERO, ');
       Add('    LOTEP.FAVORECIDO, ');
       Add('    PORT.DMAIS, ');
       Add('    PORT.CODPORTFORMA AS CDPORTFORMA, ');
       Add('    PORT.LANCAFINANC, ');
       Add('    PORT.PLANO, ');
       Add('    PORT.PLACONTA, ');
       Add('    LOTEP.NUMLOTE ');
       Add(' FROM ');
       Add('    LOTEPAGTO LOTEP, ');
       Add('    LOTEXDOCUM LOTEX, ');
       Add('    PORTADORFORMA PORT, ');
       Add('    PESSOA PESS ');
       Add(' WHERE ');
       Add('    LOTEX.NUMLOTE  IN ' + sFaixaLotes + '  AND ');

       If bFiltraData Then
          Add(' (LOTEP.DATAEMISSAO BETWEEN :DATAINI AND :DATAFIN) AND ');

       Add('    PESS.IDPESSOA = LOTEP.IDPESSOA  AND ');
       Add('    LOTEP.NUMLOTE = LOTEX.NUMLOTE  AND ');
       Add('    LOTEP.CODPORTFORMA = PORT.CODPORTFORMA ');

       Prepare;
       If bFiltraData Then
       Begin
          ParamByName('DATAINI').AsDate := CmpSelLotePagto.ParamValues[1].AsDateTime;
          ParamByName('DATAFIN').AsDate := CmpSelLotePagto.ParamValues[2].AsDateTime;
       End;
       Open;
    End;

    rValor := 0;
    if Not CdsDocXPortForma.isEmpty then
    Begin
       CdsDocXPortForma.First;
       While not CdsDocXPortForma.Eof Do
       Begin
          rValor := rValor + CdsDocXPortForma.FieldByname('VALOR').AsFloat;
          CdsDocXPortForma.Next;
       End;
       Result := (MsgDlg('O Valor total dos documentos a serem pagos é de ' + Trim(Format('%17.2f',[rValor])) + (#13+#10) +
                          'Confirma Pagamento?','Confirmação',mtConfirmation, [mbYes, mbNo], 0) = mrYes);

       CdsDocXPortForma.first;
    End;
  End;

begin
  inherited;
  //Marcus Oliveira P. 26020 14/08/2007 Inicio
  sqlPortConta.Prepare;
  sqlPortConta.ParamByName('IDPORTAFORMA').AsInteger := CdsSel.fieldbyname('CODPORTFORMA').AsInteger;
  sqlPortConta.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  sqlPortConta.Open;

  if trim (cdsPortconta.FieldByName('MENSAGEM').AsString ) <> '' then
  begin
     MsgDlg( cdsPortconta.FieldByName('MENSAGEM').AsString, 'Atenção', mtError, [mbOK], 0 );
     exit;
  end;
  //Marcus Oliveira P. 26020 14/08/2007 Fim

  If  CdsSel.IsEmpty Then
  Begin
     Msgdlg('Favor Informar os lotes a serem pagos','Aviso',mterror,[mbOk],0);
     Exit;
  End;

//Marcus Oliveira P. 24309 07/03/2007
   cmpPagAutomatico.Execute;
   dDataBaixa := cmpPagAutomatico.ParamValues[0].AsDateTime;
   BaixaDocumentos.Observacao := cmpPagAutomatico.ParamValues[1].AsString;

  //Bruno Bastos - Sol 126261 - Início
  //Bruno Bastos - Sol 129418 - Início
  if (not cdsDocsFilhoPag.IsEmpty) and (not cdsDocsFilhoRec.IsEmpty) then
  begin
  //Bruno Bastos - Sol 129418 - Fim
    //Bruno Bastos - Sol: 130745 - Kintana: 735881 - if not BaixaRecXPag.FazRecxPagto(dDataBaixa, cdsDocsFilhoPag.data, cdsDocsFilhoRec.data) then
    if not BaixaRecXPag.FazRecxPagto(cdsDocsFilhoPag.FieldByName('DATAPROGRAMADA').AsDateTime, cdsDocsFilhoPag.data, cdsDocsFilhoRec.data) then //Bruno Bastos - Sol: 130745 - Kintana: 735881
    begin
      MsgDlg(BaixaRecXPag.MessageInfo, 'Informação', mtInformation, [mbOk], 0);
      exit;
    End;
  end; //Bruno Bastos - Sol 129418
  //Bruno Bastos - Sol 126261 - Fim


  Begin
     if BaixaDocumentos.ProcessaBaixaAutomatica(CdsSel.Data, 0, //Paulo Nobre SOL 235849 PPM 459943
        dDataBaixa,
        TSistemaLancto(Sistema.IdModulo - 3), Modulo.LancaBaixaFloat, Sistema.IdUsuario,
        Sistema.IdEmpresa, Sistema.IdEspAcesso,
        ParamIntegra.Plano, Sistema.UsaPlanoPatro, ParamIntegra.IntegraContab,
        ParamIntegra.PartidaDobrada, ParamIntegra.RecPag) then
     begin
       MsgDlg('Lote(s) baixado(s) com sucesso', Caption, mtInformation, [mbOk], 0);
       SelFaixaLotes(false);
     end
     else
       MsgDlg(BaixaDocumentos.MessageInfo,'Atenção',mtError, [mbOk], 0);
  End;
end;

procedure TFrmBaixaAutomaticaMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  SelFaixaLotes(True);
end;

procedure TFrmBaixaAutomaticaMT.ActBaixaAutomaticaUpdate(
  Action: TBasicAction; var Handled: Boolean);
begin
  inherited;
  bbtnConfirmar.Enabled := Not CdsSel.IsEmpty;
  bbtnCancelar.Enabled := bbtnConfirmar.Enabled;
  ActExclui.Enabled := bbtnConfirmar.Enabled;
  ActAdicionar.Enabled := Not CdsPend.IsEmpty;
end;

procedure TFrmBaixaAutomaticaMT.ActAdicionarExecute(Sender: TObject);
var
  I : integer;
  sListaLote : String;

begin
  inherited;
  //Bruno Bastos - 16/12/2009 - Início
  For I := 0 To DbGrdOrigem.SelectedList.count - 1 Do
  Begin
    if BaixaDocumentos.DocTemPai(0, DbGrdOrigem.DataSource.DataSet.FieldByName('NUMLOTE').AsInteger) then
    begin
      if sListaLote = '' then
        sListaLote := DbGrdOrigem.DataSource.DataSet.FieldByName('NUMLOTE').AsString
      else
        sListaLote := sListaLote + ',' + DbGrdOrigem.DataSource.DataSet.FieldByName('NUMLOTE').AsString;
    end;
  end;

  if sListaLote <> '' then
  begin
    if pos(',', sListaLote) > 0 then
      MsgDlg( ' Existe documento(s) "filho(s)" nestes lotes. '+#13#10+
              ' Lotes com documento(s) "filho(s)": '+sListaLote, 'Aviso', mtinformation, [mbOk], 0 )
    else
      MsgDlg( ' Existe documento(s) "filho(s)" neste lote. '+#13#10+
              ' Lote com documento(s) "filho(s)": '+sListaLote, 'Aviso', mtinformation, [mbOk], 0 );
    exit;
  end;
  //Bruno Bastos - 16/12/2009 - Fim

  MoveRegistros(DbGrdOrigem,DbGrdDestino);

  //Bruno Bastos - Sol 126261 - Início
  SqlDocsFilhoPag.open;
  SqlDocsFilhoRec.open;
  DbGrdDestino.DataSource.DataSet.First;
  while not DbGrdDestino.DataSource.DataSet.eof do
  begin
    cdsAux.Data := BaixaDocumentos.BuscaDocFilho(0, DbGrdDestino.DataSource.DataSet.FieldByName('NUMLOTE').AsInteger);
    while not cdsAux.eof do
    begin
      if cdsAux.FieldByName('RECPAG').AsString = 'P' then
      begin
        CdsDocsFilhoPag.Insert;
        CdsDocsFilhoPag.FieldByName('SELECIONA').AsString       := 'S';
        CdsDocsFilhoPag.FieldByName('BAIXAPARCIAL').AsString    := 'N';
        CdsDocsFilhoPag.FieldByName('CODTIPDOC').AsInteger      := cdsAux.FieldByName('CODTIPDOC').AsInteger;
        CdsDocsFilhoPag.FieldByName('IDMODULO').AsInteger       := cdsAux.FieldByName('IDMODULO').AsInteger;
        CdsDocsFilhoPag.FieldByName('IDFORCLI').AsInteger       := cdsAux.FieldByName('IDFORCLI').AsInteger;
        CdsDocsFilhoPag.FieldByName('OPERACAO').AsString        := cdsAux.FieldByName('OPERACAO').AsString;
        CdsDocsFilhoPag.FieldByName('IDPESSOA').AsString        := cdsAux.FieldByName('IDPESSOA').AsString;
        CdsDocsFilhoPag.FieldByName('CODDOCUMENTO').AsInteger   := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
        CdsDocsFilhoPag.FieldByName('NODOCUMENTO').AsString     := cdsAux.FieldByName('NODOCUMENTO').AsString;
        CdsDocsFilhoPag.FieldByName('COMPLDOCUMENTO').AsString  := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
        CdsDocsFilhoPag.FieldByName('DATAPROGRAMADA').AsString  := cdsAux.FieldByName('DATAPROGRAMADA').AsString;
        CdsDocsFilhoPag.FieldByName('DATAVENCTO').AsString      := cdsAux.FieldByName('DATAVENCTO').AsString;
        CdsDocsFilhoPag.FieldByName('RECPAG').AsString          := cdsAux.FieldByName('RECPAG').AsString;
        CdsDocsFilhoPag.FieldByName('NOME').AsString            := cdsAux.FieldByName('NOME').AsString;
        CdsDocsFilhoPag.FieldByName('STATUS').AsString          := cdsAux.FieldByName('STATUS').AsString;
        CdsDocsFilhoPag.FieldByName('MOECODIGO').AsString       := cdsAux.FieldByName('MOECODIGO').AsString;
        CdsDocsFilhoPag.FieldByName('PLANO').AsString           := cdsAux.FieldByName('PLANO').AsString;
        CdsDocsFilhoPag.FieldByName('PLACONTA').AsString        := cdsAux.FieldByName('PLACONTA').AsString;
        CdsDocsFilhoPag.FieldByName('CODCENTROCUSTO').AsString  := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
        CdsDocsFilhoPag.FieldByName('CODSUBCONTA').AsString     := cdsAux.FieldByName('CODSUBCONTA').AsString;
        CdsDocsFilhoPag.FieldByName('CODGRUPOCNAB').AsString    := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
        CdsDocsFilhoPag.FieldByName('NOSSONUMERO').AsString     := cdsAux.FieldByName('NOSSONUMERO').AsString;
        CdsDocsFilhoPag.FieldByName('NUMLANCTO').AsInteger      := cdsAux.FieldByName('NUMLANCTO').AsInteger;
        CdsDocsFilhoPag.FieldByName('VLRLIQUIDO').AsFloat       := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
        CdsDocsFilhoPag.FieldByName('DEBCRE').AsString          := cdsAux.FieldByName('DEBCRE').AsString;
        CdsDocsFilhoPag.FieldByName('VALOROUTRAMOEDA').AsFloat  := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
        CdsDocsFilhoPag.FieldByName('SALDO').AsFloat            := cdsAux.FieldByName('SALDO').AsFloat;
        CdsDocsFilhoPag.FieldByName('SALDO1').AsFloat           := cdsAux.FieldByName('SALDO1').AsFloat;
        CdsDocsFilhoPag.Post;
      end
      else
      begin
        CdsDocsFilhoRec.Insert;
        CdsDocsFilhoRec.FieldByName('SELECIONA').AsString       := 'S';
        CdsDocsFilhoRec.FieldByName('BAIXAPARCIAL').AsString    := 'N';
        CdsDocsFilhoRec.FieldByName('CODTIPDOC').AsInteger      := cdsAux.FieldByName('CODTIPDOC').AsInteger;
        CdsDocsFilhoRec.FieldByName('IDMODULO').AsInteger       := cdsAux.FieldByName('IDMODULO').AsInteger;
        CdsDocsFilhoRec.FieldByName('IDFORCLI').AsInteger       := cdsAux.FieldByName('IDFORCLI').AsInteger;
        CdsDocsFilhoRec.FieldByName('OPERACAO').AsString        := cdsAux.FieldByName('OPERACAO').AsString;
        CdsDocsFilhoRec.FieldByName('IDPESSOA').AsString        := cdsAux.FieldByName('IDPESSOA').AsString;
        CdsDocsFilhoRec.FieldByName('CODDOCUMENTO').AsInteger   := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
        CdsDocsFilhoRec.FieldByName('NODOCUMENTO').AsString     := cdsAux.FieldByName('NODOCUMENTO').AsString;
        CdsDocsFilhoRec.FieldByName('COMPLDOCUMENTO').AsString  := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
        CdsDocsFilhoRec.FieldByName('DATAPROGRAMADA').AsString  := cdsAux.FieldByName('DATAPROGRAMADA').AsString;
        CdsDocsFilhoRec.FieldByName('DATAVENCTO').AsString      := cdsAux.FieldByName('DATAVENCTO').AsString;
        CdsDocsFilhoRec.FieldByName('RECPAG').AsString          := cdsAux.FieldByName('RECPAG').AsString;
        CdsDocsFilhoRec.FieldByName('NOME').AsString            := cdsAux.FieldByName('NOME').AsString;
        CdsDocsFilhoRec.FieldByName('STATUS').AsString          := cdsAux.FieldByName('STATUS').AsString;
        CdsDocsFilhoRec.FieldByName('MOECODIGO').AsString       := cdsAux.FieldByName('MOECODIGO').AsString;
        CdsDocsFilhoRec.FieldByName('PLANO').AsString           := cdsAux.FieldByName('PLANO').AsString;
        CdsDocsFilhoRec.FieldByName('PLACONTA').AsString        := cdsAux.FieldByName('PLACONTA').AsString;
        CdsDocsFilhoRec.FieldByName('CODCENTROCUSTO').AsString  := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
        CdsDocsFilhoRec.FieldByName('CODSUBCONTA').AsString     := cdsAux.FieldByName('CODSUBCONTA').AsString;
        CdsDocsFilhoRec.FieldByName('CODGRUPOCNAB').AsString    := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
        CdsDocsFilhoRec.FieldByName('NOSSONUMERO').AsString     := cdsAux.FieldByName('NOSSONUMERO').AsString;
        CdsDocsFilhoRec.FieldByName('NUMLANCTO').AsInteger      := cdsAux.FieldByName('NUMLANCTO').AsInteger;
        CdsDocsFilhoRec.FieldByName('VLRLIQUIDO').AsFloat       := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
        CdsDocsFilhoRec.FieldByName('DEBCRE').AsString          := cdsAux.FieldByName('DEBCRE').AsString;
        CdsDocsFilhoRec.FieldByName('VALOROUTRAMOEDA').AsFloat  := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
        CdsDocsFilhoRec.FieldByName('SALDO').AsFloat            := cdsAux.FieldByName('SALDO').AsFloat;
        CdsDocsFilhoRec.FieldByName('SALDO1').AsFloat           := cdsAux.FieldByName('SALDO1').AsFloat;
        CdsDocsFilhoRec.Post;
      end;
      cdsAux.Next;
    end;
    DbGrdDestino.DataSource.DataSet.Next;
  end;
  //Bruno Bastos - Sol 126261 - Fim

end;

procedure TFrmBaixaAutomaticaMT.ActExcluiExecute(Sender: TObject);
begin
  inherited;
  MoveRegistros(DbGrdDestino,dbGrdOrigem);

  //Bruno Bastos - Sol 126261 - Início
  SqlDocsFilhoPag.open;
  SqlDocsFilhoRec.open;
  DbGrdDestino.DataSource.DataSet.First;
  while not DbGrdDestino.DataSource.DataSet.eof do
  begin
    cdsAux.Data := BaixaDocumentos.BuscaDocFilho(0, DbGrdDestino.DataSource.DataSet.FieldByName('NUMLOTE').AsInteger);
    while not cdsAux.eof do
    begin
      if cdsAux.FieldByName('RECPAG').AsString = 'P' then
      begin
        CdsDocsFilhoPag.Insert;
        CdsDocsFilhoPag.FieldByName('SELECIONA').AsString       := 'S';
        CdsDocsFilhoPag.FieldByName('BAIXAPARCIAL').AsString    := 'N';
        CdsDocsFilhoPag.FieldByName('IDFORCLI').AsInteger       := cdsAux.FieldByName('IDFORCLI').AsInteger;
        CdsDocsFilhoPag.FieldByName('OPERACAO').AsString        := cdsAux.FieldByName('OPERACAO').AsString;
        CdsDocsFilhoPag.FieldByName('IDPESSOA').AsString        := cdsAux.FieldByName('IDPESSOA').AsString;
        CdsDocsFilhoPag.FieldByName('CODDOCUMENTO').AsInteger   := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
        CdsDocsFilhoPag.FieldByName('NODOCUMENTO').AsString     := cdsAux.FieldByName('NODOCUMENTO').AsString;
        CdsDocsFilhoPag.FieldByName('COMPLDOCUMENTO').AsString  := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
        CdsDocsFilhoPag.FieldByName('DATAPROGRAMADA').AsString  := cdsAux.FieldByName('DATAPROGRAMADA').AsString;
        CdsDocsFilhoPag.FieldByName('DATAVENCTO').AsString      := cdsAux.FieldByName('DATAVENCTO').AsString;
        CdsDocsFilhoPag.FieldByName('RECPAG').AsString          := cdsAux.FieldByName('RECPAG').AsString;
        CdsDocsFilhoPag.FieldByName('NOME').AsString            := cdsAux.FieldByName('NOME').AsString;
        CdsDocsFilhoPag.FieldByName('STATUS').AsString          := cdsAux.FieldByName('STATUS').AsString;
        CdsDocsFilhoPag.FieldByName('MOECODIGO').AsString       := cdsAux.FieldByName('MOECODIGO').AsString;
        CdsDocsFilhoPag.FieldByName('PLANO').AsString           := cdsAux.FieldByName('PLANO').AsString;
        CdsDocsFilhoPag.FieldByName('PLACONTA').AsString        := cdsAux.FieldByName('PLACONTA').AsString;
        CdsDocsFilhoPag.FieldByName('CODCENTROCUSTO').AsString  := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
        CdsDocsFilhoPag.FieldByName('CODSUBCONTA').AsString     := cdsAux.FieldByName('CODSUBCONTA').AsString;
        CdsDocsFilhoPag.FieldByName('CODGRUPOCNAB').AsString    := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
        CdsDocsFilhoPag.FieldByName('NOSSONUMERO').AsString     := cdsAux.FieldByName('NOSSONUMERO').AsString;
        CdsDocsFilhoPag.FieldByName('NUMLANCTO').AsInteger      := cdsAux.FieldByName('NUMLANCTO').AsInteger;
        CdsDocsFilhoPag.FieldByName('VLRLIQUIDO').AsFloat       := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
        CdsDocsFilhoPag.FieldByName('DEBCRE').AsString          := cdsAux.FieldByName('DEBCRE').AsString;
        CdsDocsFilhoPag.FieldByName('VALOROUTRAMOEDA').AsFloat  := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
        CdsDocsFilhoPag.FieldByName('SALDO').AsFloat            := cdsAux.FieldByName('SALDO').AsFloat;
        CdsDocsFilhoPag.FieldByName('SALDO1').AsFloat           := cdsAux.FieldByName('SALDO1').AsFloat;
        CdsDocsFilhoPag.Post;
      end
      else
      begin
        CdsDocsFilhoRec.Insert;
        CdsDocsFilhoRec.FieldByName('SELECIONA').AsString       := 'S';
        CdsDocsFilhoRec.FieldByName('BAIXAPARCIAL').AsString    := 'N';
        CdsDocsFilhoRec.FieldByName('IDFORCLI').AsInteger       := cdsAux.FieldByName('IDFORCLI').AsInteger;
        CdsDocsFilhoRec.FieldByName('OPERACAO').AsString        := cdsAux.FieldByName('OPERACAO').AsString;
        CdsDocsFilhoRec.FieldByName('IDPESSOA').AsString        := cdsAux.FieldByName('IDPESSOA').AsString;
        CdsDocsFilhoRec.FieldByName('CODDOCUMENTO').AsInteger   := cdsAux.FieldByName('CODDOCUMENTO').AsInteger;
        CdsDocsFilhoRec.FieldByName('NODOCUMENTO').AsString     := cdsAux.FieldByName('NODOCUMENTO').AsString;
        CdsDocsFilhoRec.FieldByName('COMPLDOCUMENTO').AsString  := cdsAux.FieldByName('COMPLDOCUMENTO').AsString;
        CdsDocsFilhoRec.FieldByName('DATAPROGRAMADA').AsString  := cdsAux.FieldByName('DATAPROGRAMADA').AsString;
        CdsDocsFilhoRec.FieldByName('DATAVENCTO').AsString      := cdsAux.FieldByName('DATAVENCTO').AsString;
        CdsDocsFilhoRec.FieldByName('RECPAG').AsString          := cdsAux.FieldByName('RECPAG').AsString;
        CdsDocsFilhoRec.FieldByName('NOME').AsString            := cdsAux.FieldByName('NOME').AsString;
        CdsDocsFilhoRec.FieldByName('STATUS').AsString          := cdsAux.FieldByName('STATUS').AsString;
        CdsDocsFilhoRec.FieldByName('MOECODIGO').AsString       := cdsAux.FieldByName('MOECODIGO').AsString;
        CdsDocsFilhoRec.FieldByName('PLANO').AsString           := cdsAux.FieldByName('PLANO').AsString;
        CdsDocsFilhoRec.FieldByName('PLACONTA').AsString        := cdsAux.FieldByName('PLACONTA').AsString;
        CdsDocsFilhoRec.FieldByName('CODCENTROCUSTO').AsString  := cdsAux.FieldByName('CODCENTROCUSTO').AsString;
        CdsDocsFilhoRec.FieldByName('CODSUBCONTA').AsString     := cdsAux.FieldByName('CODSUBCONTA').AsString;
        CdsDocsFilhoRec.FieldByName('CODGRUPOCNAB').AsString    := cdsAux.FieldByName('CODGRUPOCNAB').AsString;
        CdsDocsFilhoRec.FieldByName('NOSSONUMERO').AsString     := cdsAux.FieldByName('NOSSONUMERO').AsString;
        CdsDocsFilhoRec.FieldByName('NUMLANCTO').AsInteger      := cdsAux.FieldByName('NUMLANCTO').AsInteger;
        CdsDocsFilhoRec.FieldByName('VLRLIQUIDO').AsFloat       := cdsAux.FieldByName('VLRLIQUIDO').AsFloat;
        CdsDocsFilhoRec.FieldByName('DEBCRE').AsString          := cdsAux.FieldByName('DEBCRE').AsString;
        CdsDocsFilhoRec.FieldByName('VALOROUTRAMOEDA').AsFloat  := cdsAux.FieldByName('VALOROUTRAMOEDA').AsFloat;
        CdsDocsFilhoRec.FieldByName('SALDO').AsFloat            := cdsAux.FieldByName('SALDO').AsFloat;
        CdsDocsFilhoRec.FieldByName('SALDO1').AsFloat           := cdsAux.FieldByName('SALDO1').AsFloat;
        CdsDocsFilhoRec.Post;
      end;
      cdsAux.Next;
    end;
    DbGrdDestino.DataSource.DataSet.Next;
  end;
  //Bruno Bastos - Sol 126261 - Fim
end;

procedure TFrmBaixaAutomaticaMT.CdsPendAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('SUM(LOTEX.VALOR)')).DisplayFormat := '#,##0.00';
end;

procedure TFrmBaixaAutomaticaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  BaixaDocumentos.Free;

  //Bruno Bastos - Sol 126261 - Início
  BaixaRecXPag.Free;
  //Bruno Bastos - Sol 126261 - Fim
  
end;

end.


