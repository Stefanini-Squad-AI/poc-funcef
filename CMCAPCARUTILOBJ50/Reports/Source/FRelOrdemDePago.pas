unit FRelOrdemDePago;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, fcLabel, wwdblook, CMDBLookupCombo, EditReg,
  TB97, wwdbdatetimepicker, CMDateTimePicker, fParamReports_Padrao,
  CmParamReport, DBClient, uCMClientDataSet, uCmSqlParams, uCtrlRelatoriosCAPCAR;

type
  TFrmRelOrdemDePago = class(TfrmParamReports_Padrao)
    DsCheque: TwwDataSource;
    RgRemessa: TRadioGroup;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Panel1: TPanel;
    PnlObs: TPanel;
    PnlTotaVenc: TPanel;
    SbAdTodos: TBitBtn;
    SbAdInverte: TBitBtn;
    GrdDocsaVencer: TwwDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel3: TPanel;
    MemObs: TMemo;
    Panel6: TPanel;
    fcLabel1: TfcLabel;
    CkbListaAlteradores: TCheckBox;
    Label2: TLabel;
    CmbAlteradores: TCMDBLookupCombo;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    CmbAltRetencao: TCMDBLookupCombo;
    EdtRegAlterador: TEditReg;
    GpFaixa: TGroupBox;
    Label1: TLabel;
    DtIni: TCMDateTimePicker;
    DtFin: TCMDateTimePicker;
    SqlCheque: TCMSqlParams;
    CdsCheque: TCMClientDataSet;
    CdsTodos: TCMClientDataSet;
    SqlTodos: TCMSqlParams;
    CdsIntBanco: TCMClientDataSet;
    SqlIntBanco: TCMSqlParams;
    CdsOp: TCMClientDataSet;
    SqlOp: TCMSqlParams;
    CdsAlteradores: TCMClientDataSet;
    SqlAlteradores: TCMSqlParams;
    SqlChequeOriginal: TCMSqlParams;
    CdsParaParam: TCMClientDataSet;
    CdsParaParamDoc: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SbAdTodosClick(Sender: TObject);
    procedure SbAdInverteClick(Sender: TObject);
    procedure GrdDocsaVencerCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure RgRemessaClick(Sender: TObject);
    procedure CmbAltRetencaoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
    sNumSlip: string;
    CtrlRelatoriosCAPCAR: TCtrlRelatoriosCAPCAR;
  public
    { Public declarations }
  end;

var
  FrmRelOrdemDePago: TFrmRelOrdemDePago;

implementation

{$R *.DFM}

uses uSistema, DbaseDados;

procedure TFrmRelOrdemDePago.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRelatoriosCAPCAR := TCtrlRelatoriosCAPCAR.Create;
  CtrlRelatoriosCAPCAR.Initialize(DtmBaseDados.dbBaseDados, true, Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer,
    True);
  PnlObs.Visible := true;
  caption := 'Parâmetros do relatório Ordem de Pagamento';
  RgRemessa.Items.Add('Ordem de Pagto');
  sNumSlip := '0';
  SqlAlteradores.Prepare;
  SqlAlteradores.ParamByname('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  SqlAlteradores.Open;
  with SqlTodos do
  begin
    sql.CLEAR;
    sql.add('SELECT  LP.NUMLOTE, LP.DATAEMISSAO,  LP.NUMCHQBORDERO, LP.FAVORECIDO,     ');
    sql.add('SUM(LD.VALOR),(0) AS EMITE FROM   LOTEPAGTO LP,  LOTEXDOCUM LD            ');
    sql.add(',(select count(*) as totdocum , numlote from lotexdocum ld , documento d  ');
    sql.add('   where D.RECPAG         = ''P''  AND                                    ');
    sql.add('         ld.CODDOCUMENTO = D.CODDOCUMENTO group by numlote  ) totdocum    ');
    sql.add(',(select count(*) as totdocum , numlote from lotexdocum ld , documento d  ');
    sql.add('   where D.RECPAG         = ''P''  AND                                    ');
    sql.add('         ld.CODDOCUMENTO = D.CODDOCUMENTO  and                            ');
    sql.add('         d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a            ');
    sql.add('                         WHERE a.RECPAG =  ''P''                          ');
    sql.add(' and not exists  (select 1 from UsuarioxTpdocto b where recpag=''P''      ');
    sql.add('                  and b.idusuario= :IdUsuario)                            ');
    sql.add(' union                                                                    ');
    sql.add(' SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''P''          ');
    sql.add('    and exists (select 1 from UsuarioxTpdocto b                           ');
    sql.add('                where recpag=''P'' and a.codtipdoc=b.codtipdoc and        ');
    sql.add('                      b.idusuario= :IdUsuario)) group by numlote) totlote ');
  end;
  with SqlTodos do
  begin
    sql.add('WHERE (LP.DATAEMISSAO BETWEEN :PDATAINI AND :PDATAFIM) AND                ');
    sql.add('(LP.IDPESSOA = :PIDPESSOA) AND (LP.FLAGEMISSAO = 1 ) AND                  ');
    sql.add('((LP.FLAGCANCEL <> ''C'' AND LP.FLAGCANCEL <> ''R'')                      ');
    sql.add('  OR LP.FLAGCANCEL IS NULL) AND(LP.NUMLOTE = LD.NUMLOTE) AND              ');
    sql.add('  totlote.totdocum=totdocum.totdocum and                                  ');
    sql.add(' totlote.numlote=totdocum.numlote and   totlote.numlote=  lp.NUMLOTE  and ');
    sql.add('(EXISTS (SELECT 1 FROM DOCUMENTO D                                        ');
    sql.add('         WHERE (D.CODDOCUMENTO=LD.CODDOCUMENTO)                           ');
    sql.add('           AND (lp.NUMSLIP IS NULL)))                                     ');
    sql.add('GROUP BY LP.NUMLOTE, LP.DATAEMISSAO, LP.NUMCHQBORDERO, LP.FAVORECIDO      ');
    sql.add('ORDER BY   LP.NUMCHQBORDERO                                               ');
  end;
  with SqlCheque do
  begin
    sql.CLEAR;
    sql.add('SELECT LP.NUMLOTE, LP.DATAEMISSAO,LP.NUMCHQBORDERO,LP.FAVORECIDO,         ');
    sql.add('       SUM(LD.VALOR),(0) AS EMITE                                         ');
    sql.add(' FROM LOTEPAGTO LP,LOTEXDOCUM LD, PORTADORFORMA PF                        ');
    sql.add(',(select count(*) as totdocum , numlote from lotexdocum ld , documento d  ');
    sql.add('  where D.RECPAG = ''P''  AND ld.CODDOCUMENTO = D.CODDOCUMENTO            ');
    sql.add('  group by numlote) totdocum                                              ');
    sql.add(',(select count(*) as totdocum , numlote                                   ');
    sql.add('  from lotexdocum ld , documento d                                        ');
    sql.add('  where D.RECPAG = ''P'' AND ld.CODDOCUMENTO = D.CODDOCUMENTO  and        ');
    sql.add('        d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a             ');
    sql.add('                        WHERE a.RECPAG =  ''P''                           ');
    sql.add('                          and not exists (select 1 from UsuarioxTpdocto b ');
    sql.add('                                          where recpag=''P'' and          ');
    sql.add('                                                b.idusuario=:IdUsuario)   ');
    sql.add('  union                                                                   ');
    sql.add('  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG =   ''P''         ');
    sql.add('     and exists (select 1 from UsuarioxTpdocto b where recpag=''P'' and   ');
    sql.add('                     a.codtipdoc=b.codtipdoc and b.idusuario=:IdUsuario)) ');
    sql.add('                 group by numlote  ) totlote                              ');
    sql.add(' WHERE (PF.IDTEMPLCHEQUE IS NOT NULL) AND                                 ');
    sql.add('       (CODARQUIVOREMESSA IS NOT NULL) AND                                ');
    sql.add('       (LP.DATAEMISSAO BETWEEN :PDATAINI AND :PDATAFIM) AND               ');
    sql.add('       (LP.IDPESSOA = :PIDPESSOA) AND  (LP.FLAGEMISSAO = 1) AND           ');
    sql.add('       ((LP.FLAGCANCEL <> ''C'' AND LP.FLAGCANCEL <> ''R'')               ');
    sql.add('         OR LP.FLAGCANCEL IS NULL) AND                                    ');
    sql.add('       (LP.NUMLOTE = LD.NUMLOTE) AND                                      ');
    sql.add('       (PF.CODPORTFORMA = LP.CODPORTFORMA)AND                             ');
    sql.add('       totlote.totdocum=totdocum.totdocum and                             ');
    sql.add('       totlote.numlote=totdocum.numlote and                               ');
    sql.add('       totlote.numlote = lp.NUMLOTE  and                                  ');
    sql.add('       (EXISTS (SELECT 1 FROM DOCUMENTO D WHERE                           ');
    sql.add('                  (D.CODDOCUMENTO=LD.CODDOCUMENTO) AND                    ');
    sql.add('                  (lp.NUMSLIP IS NULL) ) )                                ');
    sql.add('GROUP BY LP.NUMLOTE, LP.DATAEMISSAO, LP.NUMCHQBORDERO, LP.FAVORECIDO      ');
    sql.add('ORDER BY   LP.NUMCHQBORDERO                                               ');
  end;
  with SqlIntBanco do
  begin
    sql.CLEAR;
    sql.add(' SELECT LP.NUMLOTE, LP.DATAEMISSAO,LP.NUMCHQBORDERO,LP.FAVORECIDO,        ');
    sql.add('    SUM(LD.VALOR),(0) AS EMITE                                            ');
    sql.add(' FROM LOTEPAGTO LP,LOTEXDOCUM LD, PORTADORFORMA PF                        ');
    sql.add('      ,(select count(*) as totdocum , numlote                             ');
    sql.add('        from lotexdocum ld , documento d                                  ');
    sql.add('        where D.RECPAG = ''P'' AND ld.CODDOCUMENTO = D.CODDOCUMENTO       ');
    sql.add('        group by numlote  ) totdocum                                      ');
    sql.add('      ,(select count(*) as totdocum , numlote                             ');
    sql.add('        from lotexdocum ld , documento d                                  ');
    sql.add('        where D.RECPAG = ''P'' AND ld.CODDOCUMENTO = D.CODDOCUMENTO  and  ');
    sql.add('              d.codtipdoc in (SELECT CODTIPDOC FROM TIPODOCRECPAG a       ');
    sql.add('                              WHERE a.RECPAG = ''P'' and not exists       ');
    sql.add('                                 (select 1 from UsuarioxTpdocto b         ');
    sql.add('                                  where recpag=''P'' and                  ');
    sql.add('                                        b.idusuario=:IdUsuario)           ');
    sql.add('                              union                                       ');
    sql.add('                              SELECT CODTIPDOC FROM TIPODOCRECPAG a       ');
    sql.add('                               WHERE a.RECPAG =   ''P''                   ');
    sql.add('                                 and exists                               ');
    sql.add('                                     (select 1 from UsuarioxTpdocto b     ');
    sql.add('                                      where recpag=''P''                  ');
    sql.add('                                        and a.codtipdoc=b.codtipdoc       ');
    sql.add('                                        and b.idusuario=:IdUsuario))      ');
    sql.add('                                      group by numlote  ) totlote         ');
    sql.add('WHERE (PF.CODARQUIVOREMESSA IS NOT NULL) AND                              ');
    sql.add('      (LP.DATAEMISSAO BETWEEN :PDATAINI AND :PDATAFIM) AND                ');
    sql.add('      (LP.IDPESSOA = :PIDPESSOA) AND   (LP.FLAGEMISSAO = 1) AND           ');
    sql.add('      ((LP.FLAGCANCEL <> ''C'' AND LP.FLAGCANCEL <> ''R'')                ');
    sql.add('        OR LP.FLAGCANCEL IS NULL) AND                                     ');
    sql.add('      (LP.FLAGCANCEL <> ''C'' OR LP.FLAGCANCEL IS NULL) AND               ');
    sql.add('      totlote.totdocum = totdocum.totdocum and                            ');
    sql.add('      totlote.numlote = totdocum.numlote and                              ');
    sql.add('      totlote.numlote = lp.NUMLOTE  and                                   ');
    sql.add('      (LP.NUMLOTE = LD.NUMLOTE) AND                                       ');
    sql.add('      (LP.CODPORTFORMA = PF.CODPORTFORMA) AND                             ');
    sql.add('      (EXISTS (SELECT 1 FROM DOCUMENTO D                                  ');
    sql.add('               WHERE(D.CODDOCUMENTO = LD.CODDOCUMENTO) and                ');
    sql.add('                     (LP.NUMSLIP IS NULL) ) )                             ');
    sql.add('GROUP BY  LP.NUMLOTE, LP.DATAEMISSAO, LP.NUMCHQBORDERO, LP.FAVORECIDO     ');
    sql.add('ORDER BY   LP.NUMCHQBORDERO                                               ');
  end;
  SqlChequeOriginal.SQL.Text := SqlCheque.SQL.Text;
  EdtRegAlterador.RegPath := 'Software\CM\' + Sistema.NomeModulo + '\Geral';
  EdtRegAlterador.Refresh;
  if Trim(EdtRegAlterador.Text) = '' then
    EdtRegAlterador.Text := '0';
  CmbAltRetencao.LookupValue := EdtRegAlterador.Text;
  CmbAltRetencao.RefreshDisplay;
end;

procedure TFrmRelOrdemDePago.BitBtn1Click(Sender: TObject);
begin
  inherited;
  case RgRemessa.ItemIndex of
    0: SqlCheque.SQL.Text := SqlTodos.SQL.Text;
    1: SqlCheque.SQL.Text := SqlChequeOriginal.SQL.Text;
    2: SqlCheque.SQL.Text := SqlIntBanco.SQL.Text;
    3: SqlCheque.SQL.Text := SqlOp.SQL.Text;
  end;
  if (DtIni.Text <> '') and (DtFin.Text <> '') then
  begin
    if not SqlCheque.Prepared then
      SqlCheque.Prepare;
    CdsCheque.Close;
    if RgRemessa.ItemIndex = 3 then
    begin
      if InputQuery('Seleciona Lote', 'Entre Com o Nº da Ordem de Pagamento', sNumSlip) then
      begin
        sNumSlip := Trim(sNumSlip);
        if (sNumSlip = '0') or (sNumslip = '') then
          Exit;
        SqlCheque.ParamByName('IDUSUARIO').AsFloat := Sistema.idusuario;
        SqlCheque.ParamByName('NUMSLIP').AsString := sNumSlip;
      end
      else
        Exit;
    end
    else
    begin
      SqlCheque.Parambyname('PDATAINI').AsDateTime := StrToDate(DtIni.Text);
      SqlCheque.Parambyname('PDATAFIM').AsDateTime := StrToDate(DtFin.Text);
      SqlCheque.Parambyname('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      SqlCheque.Parambyname('idusuario').AsInteger := Sistema.idusuario;
    end;

    SqlCheque.Open;
    PnlTotaVenc.Enabled := not CdsCheque.IsEmpty;

    if RgRemessa.ItemIndex = 3 then
    begin
      SbAdTodos.Click;
      GrdDocsaVencer.ReadOnly := True
    end
    else
      GrdDocsaVencer.ReadOnly := False;
  end;
end;

procedure TFrmRelOrdemDePago.SbAdTodosClick(Sender: TObject);
begin
  inherited;
  CdsCheque.First;
  while not CdsCheque.Eof do
  begin
    CdsCheque.Edit;
    CdsCheque.FieldByName('EMITE').AsString := '1';
    CdsCheque.Post;
    CdsCheque.Next;
  end;
  CdsCheque.First;
end;

procedure TFrmRelOrdemDePago.SbAdInverteClick(Sender: TObject);
begin
  inherited;
  CdsCheque.First;
  while not CdsCheque.Eof do
  begin
    CdsCheque.Edit;
    if CdsCheque.FieldByName('EMITE').AsString = '1' then
      CdsCheque.FieldByName('EMITE').AsString := '0'
    else
      CdsCheque.FieldByName('EMITE').AsString := '1';
    CdsCheque.Post;
    CdsCheque.Next;
  end;
  CdsCheque.First;
end;

procedure TFrmRelOrdemDePago.GrdDocsaVencerCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if (Field.FieldName = 'EMITE') then
    ABrush.Color := $0080FFFF;
end;

procedure TFrmRelOrdemDePago.bbtnConfirmarClick(Sender: TObject);
var
  slista: string;
begin
  inherited;
  if not CdsCheque.IsEmpty then
  begin
    CdsCheque.First;
    while not CdsCheque.Eof do
    begin
      if CdsCheque.FieldByName('EMITE').AsString = '1' then
      begin
        sLista := sLista + CdsCheque.FieldByName('NUMLOTE').AsString + ',';
        CdsParaParam.Append;
        CdsParaParam.Fields[0].AsString := CdsCheque.FieldByName('NUMLOTE').AsString;
        CdsParaParam.Post;
      end;
      CdsCheque.Next;
    end;
    sLista := Copy(sLista, 1, Length(sLista) - 1);
  end;

  sNumSlip := Trim(sNumSlip);
  if (sNumSlip <> '') and (sNumSlip <> '0') then
    //
  else
  begin
    if not CtrlRelatoriosCAPCAR.SetNumSlipNumLote(CdsParaParam.Data) then
      //
      ;
  end;
  Cmp_Padrao.ParamValues[0].AsString := sLista;
  Cmp_Padrao.ParamValues[1].AsString := EdtRegAlterador.Text;
end;

procedure TFrmRelOrdemDePago.RgRemessaClick(Sender: TObject);
begin
  inherited;
  if CdsCheque.Active then
    CdsCheque.Close;
  PnlTotaVenc.Enabled := (RgRemessa.ItemIndex <> 3);
end;

procedure TFrmRelOrdemDePago.CmbAltRetencaoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  EdtRegAlterador.Text := CmbAltRetencao.LookupValue;
end;

end.

