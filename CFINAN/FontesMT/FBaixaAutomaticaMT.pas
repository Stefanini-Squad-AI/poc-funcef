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
  Grids, Wwdbigrd, Wwdbgrid, fOkCancelar, 
  Buttons, TB97Tlbr, TB97, ExtCtrls, DBTables, Db, 
  Wwquery, FSairAjuda, IvDictio, IvMulti, IvEMulti, StdCtrls,
  CmParamReport, DBClient,  uCMClientDataSet, uCmSqlParams, Wwdatsrc, MAHlpBtn,
  ActnList, ImgList, uCtrlBaixaDocumentos;

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
    SqlGrid: TCMSqlParams;
    CdsGrid: TCMClientDataSet;
    ImlBaixa: TImageList;
    ActBaixaAutomatica: TActionList;
    ActAdicionar: TAction;
    ActExclui: TAction;
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
           Add(' ( LP.DATAEMISSAO BETWEEN :DATAINI AND :DATAFIN ) AND ( LP.NUMLOTE = LD.NUMLOTE ) AND ');

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
           Add(' ( LP.DATAEMISSAO BETWEEN :DATAINI AND :DATAFIN ) AND ( LP.NUMLOTE = LD.NUMLOTE ) AND ');

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

  CmpSelLotePagto.ParamValues[0].LookupSettings.SQL.Text :=
     ' SELECT DESCRICAO,CODPORTFORMA, DMAIS, LANCAFINANC, PLANO, PLACONTA,  PLACONTACONTABCHQ, PLANOCONTABCHQ, FLGCONTABEMISCHQ  ' +
     ' FROM PORTADORFORMA ' +
     ' WHERE RECPAG = ''' + ParamIntegra.RecPag + '''' +
     ' AND PORTADORFORMA.IDPESSOA='  +IntToStr(Sistema.idEmpresa) + ' ORDER BY DESCRICAO';

  SelFaixaLotes(True);
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


    With SqlGrid, Sql Do
    Begin
       Clear;

       if ParamIntegra.RecPag = 'P' then
          Add(' SELECT  (''D'') as DEBCRE, ')
       else
          Add(' SELECT  (''C'') as DEBCRE, ');

       Add('  DOC.DATAPROGRAMADA, ');
       Add('  LOTE.CODPORTFORMA, ');
       Add('  DOC.IDPESSOA, ');
       Add('  PESS.RAZAOSOCIAL AS NOME, ');
       Add('  DOC.DATAVENCTO, ');
       Add('  DOC.NoDOCUMENTO, ');
       Add('  DOC.COMPLDOCUMENTO, ');
       Add('  DOC.CODTIPDOC, ');
       Add('  DOC.CODDOCUMENTO, ');
       Add('  DOC.OPERACAO, ');
       Add('  LOTE.NUMLOTE, ');
       Add('  DOC.PLANO , ');
       Add('  DOC.PLACONTA, ');
       Add('  DOC.CODSUBCONTA, ');
       Add('  DOC.CODCENTROCUSTO, ');
       Add('  LOTE.CODLANCFINANC, ');
       Add('  LOTEX.VALOR, ');
       Add('  LOTE.NUMCHQBORDERO, ');
       Add('  LOTEX.FLGBAIXA ');
       Add('  FROM  ');
       Add('   DOCUMENTO DOC,  ');
       Add('   PESSOA PESS,  ');
       Add('   LOTEXDOCUM LOTEX ,  ');
       Add('   LOTEPAGTO LOTE  ');
       Add('  WHERE LOTEX.NUMLOTE IN ' + sFaixaLotes + ' AND  ');
       Add('        DOC.IDPESSOA = :IDPESSOA AND  ');
       Add('        DOC.RECPAG = :RECPAG AND  ');
       Add('        (LOTEX.FLGBAIXA = '' ''  OR LOTEX.FLGBAIXA IS NULL) AND ');
       Add('        LOTE.NUMLOTE    = LOTEX.NUMLOTE AND ');
       Add('        DOC.IDFORCLI = PESS.IDPESSOA AND ');
       Add('        LOTEX.CODDOCUMENTO = DOC.CODDOCUMENTO ');

       Prepare;
       ParamByName('IDPESSOA').AsFloat := Sistema.IdEmpresa;
       ParamByName('RECPAG').AsString := ParamIntegra.RecPag;
       Open;

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
  End;

begin
  inherited;
  If  CdsSel.IsEmpty Then
  Begin
     Msgdlg('Favor Informar os lotes a serem pagos','Aviso',mterror,[mbOk],0);
     Exit;
  End;

  dDataBaixa := Date;
  If InputDate('Pagamento Automático','Indique a Data Para Pagamento dos Lotes:',dDataBaixa) And
     MontaSqlDocs Then
  Begin
     if BaixaDocumentos.ProcessaBaixaAutomatica(CdsSel.Data, CdsGrid.Data, dDataBaixa,
        TSistemaLancto(Sistema.IdModulo - 3), Modulo.LancaBaixaFloat, Sistema.IdUsuario,
        Sistema.IdEmpresa, Sistema.IdEspAcesso,
        ParamIntegra.Plano, Sistema.UsaPlanoPatro, ParamIntegra.IntegraContab,
        ParamIntegra.PartidaDobrada) then
     begin
       MsgDlg('Lote(s) baixado(s) com sucesso', Caption, mtInformation, [mbOk], 0);
       SelFaixaLotes(true);
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
begin
  inherited;
  MoveRegistros(DbGrdOrigem,DbGrdDestino);
end;

procedure TFrmBaixaAutomaticaMT.ActExcluiExecute(Sender: TObject);
begin
  inherited;
  MoveRegistros(DbGrdDestino,dbGrdOrigem);
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
end;

end.


