unit FAssocContribuicaoParticip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar,wwdblook, ExtCtrls, Spin, MAHlpBtn,
  Buttons, TB97, ComCtrls, checklst, Db, DBTables, Wwquery, URegra, Mask,
  DBCtrls, TREdit, TB97Tlbr, IvDictio, IvMulti, IvEMulti, StdCtrls;

type
  TfrmAssocContribuicaoParticip = class(TfrmOkCancelar)
    pnlControle: TPanel;
    pnlOpcoes: TPanel;
    qryAux: TwwQuery;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    qryContribuicao: TwwQuery;
    qrySitPart: TwwQuery;
    qryContribAssoc: TwwQuery;
    btnAssocContribuicoes: TBitBtn;
    GroupBox1: TGroupBox;
    lbPatro: TLabel;
    chklstPatro: TCheckListBox;
    Label7: TLabel;
    chklstPlano: TCheckListBox;
    Label3: TLabel;
    chklstContribuicao: TCheckListBox;
    rgTipo: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure btnAssocContribuicoesClick(Sender: TObject);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure chklstPlanoClickCheck(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
  private
    { Private declarations }
    strPatro, strPlano, strContribuicao: string;
    procedure CriaLista(chkListX: TCheckListBox; qryLista: TwwQuery);
    procedure CriaListaContrib(chkListX: TCheckListBox; qryLista: TwwQuery);
  public
    { Public declarations }
  end;
var
  frmAssocContribuicaoParticip: TfrmAssocContribuicaoParticip;

implementation

uses UDataBase, UMensErro, UContribuicaoPrev;

{$R *.DFM}

procedure TfrmAssocContribuicaoParticip.FormActivate(Sender: TObject);
begin
  inherited;
  qrySitPart.Close; qrySitPart.Open;

 {Preencher chkList da Patrocinadora}
  qryPatro.Close; qryPatro.Open;
  CriaLista(chkLstPatro, qryPatro);

 {Preenche ChkList dos Planos}
  qryPlano.Close; qryPlano.Open;
  CriaLista(chklstPlano, qryPlano);

 {Preenche ChkList das Contribuicoes}
  qryContribuicao.Close; qryContribuicao.Open;
  CriaListaContrib(chklstContribuicao, qryContribuicao);
end;

procedure TfrmAssocContribuicaoParticip.CriaLista(chkListX: TCheckListBox; qryLista: TwwQuery);
begin
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;
  end;
end;

procedure TfrmAssocContribuicaoParticip.CriaListaContrib(chkListX: TCheckListBox; qryLista: TwwQuery);
var
  iItems: integer;
begin
  iItems := 0;
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        if qryLista.FieldByName('FLGOBRIGATORIA').AsString <> 'O' then
           chkListX.Checked[iItems] := True;

        Inc(iItems);
        Next;
     end;
  end;
end;

procedure TfrmAssocContribuicaoParticip.chklstPatroClickCheck(Sender: TObject);
var i: integer;
begin
  inherited;
  qryPlano.Close;
  qryPlano.SQL.Clear;

  //Preenche ChkList dos Planos da Patrocinadora Selecionada
  qryPlano.Close;
  qryPlano.SQL.Clear;
  strPatro := ' ';

  for i := 0 to chklstPatro.Items.Count - 1 do
    if chklstPatro.checked[i] then
    begin
      if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive,loPartialKey]) then
        strPatro := strPatro + qryPatro.FieldByName('IdPessoa').AsString+ ', ';
    end;

  qryPlano.SQL.Add('SELECT DISTINCT PA.IDPLANASS, PA.NOME '+
                     'FROM PLANASS PA, PLANPREVASS PPA '+
                    'WHERE (PA.IDPLANASS = PPA.IDPLANASS) ');
  if Trim(strPatro) <> '' then
  begin
    strPatro := Copy(strPatro, 1, Length(strPatro) - 2);
    qryPlano.SQL.Add( 'AND (PPA.IDPESSJUR  IN ('+strPatro+')) ');
  end;
  qryPlano.SQL.Add( 'ORDER BY PA.NOME');
  qryPlano.Open;
  CriaLista(chklstPlano,qryPlano);

  //Preencher todos os Contribuicaos dos planos das patrocinadoras selecionadas
  qryContribuicao.Close;
  qryContribuicao.SQl.Clear;
  qryContribuicao.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO, C.NOME, C.FLGOBRIGATORIA '+
                            'FROM CONTRIBUICAO C, CONTRIBASS CA, PLANPREVASS PPA '+
                           'WHERE (C.IDCONTRIBUICAO = CA.IDCONTASS) '+
                             'AND (CA.IDPLANASS = PPA.IDPLANASS)');
  if Trim(strPatro) <> '' then
    qryContribuicao.SQL.Add( 'AND (PPA.IDPESSJUR IN (' + strPatro + ')) ');
  qryContribuicao.SQL.Add(   'AND (CA.PAGADOR <> ' + '''E'') ' +
                           'ORDER BY C.NOME');
  qryContribuicao.Open;
  CriaListaContrib(chklstContribuicao, qryContribuicao);
end;

procedure TfrmAssocContribuicaoParticip.chklstPlanoClickCheck(Sender: TObject);
var i: integer;
begin
  inherited;
  //Preenche ChkList das  Contribuicoes dos Planos Selecionados
  qryContribuicao.Close;
  qryContribuicao.SQL.Clear;
  strPlano := ' ';

  for i := 0 to chklstPlano.Items.Count - 1 do
     if chklstPlano.checked[i]
     then begin
        if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive,loPartialKey])
        then strPlano := strPlano + qryPlano.FieldByName('IdPlanAss').AsString+ ', ';
     end;
  qryContribuicao.SQL.Add('SELECT DISTINCT C.IDCONTRIBUICAO, C.NOME, C.FLGOBRIGATORIA '+
                            'FROM CONTRIBUICAO C, CONTRIBASS CA '+
                          ' WHERE (C.IDCONTRIBUICAO = CA.IDCONTASS) ');
  if Trim(strPlano) <> '' then
  begin
    strPlano := Copy(strPlano, 1, Length(strPlano) - 2);
    qryContribuicao.SQL.Add( 'AND (CA.IDPLANASS IN (' + strPlano + ')) ');
  end;
  qryContribuicao.SQL.Add(   'AND (CA.PAGADOR <> ' + '''E'') ' +
                           'ORDER BY C.NOME');
  qryContribuicao.Open;
  CriaListaContrib(chklstContribuicao, qryContribuicao);
end;

procedure TfrmAssocContribuicaoParticip.btnAssocContribuicoesClick(Sender: TObject);
var i, n: integer;
    sIdPagador, sSQL: string;
    bErro: boolean;
begin
  inherited;

  strPatro := '';
  strPlano := '';
  strContribuicao := '';
  if rgTipo.ItemIndex = 0 then
  begin
    //Preencher string com Id's das patrocinadoras selecionadas}
    for i := 0 to chklstPatro.Items.Count - 1 do
      if chklstPatro.checked[i] then
        if qryPatro.Locate('Nome',chklstPatro.Items[i],[loCaseInsensitive, loPartialKey]) then
          strPatro := strPatro + qryPatro.FieldByName('IDPESSOA').AsString+ ', ';

    if strPatro <> '' then
      strPatro := Copy(strPatro, 1, Length(strPatro) - 2);

    //Preencher string com Id's dos planos selecionados
    n := 0;
    for i:=0 to chklstPlano.Items.Count - 1 do
      if chklstPlano.checked[i] then
      begin
        inc(n);
        if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive, loPartialKey]) then
          strPlano := qryPlano.FieldByName('IDPLANASS').AsString;
      end;

    if n <> 1 then
    begin
      MsgDlg('Selecione apenas um Plano Assistencial.',
             'Erro', mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;

    //Preencher string com Id's das Contribuições selecionadas}
    n := 0;
    for i := 0 to chklstContribuicao.Items.Count - 1 do
      if chklstContribuicao.checked[i] then
      begin
        inc(n);
        if qryContribuicao.Locate('Nome',chklstContribuicao.Items[i],[loCaseInsensitive, loPartialKey]) then
          strContribuicao := qryContribuicao.FieldByName('IDCONTRIBUICAO').AsString;
      end;

    if n <> 1 then
    begin
      MsgDlg('Selecione apenas uma Contribuição.',
             'Erro', mtInformation, [mbOk,mbHelp], 0);
      exit;
    end;

  end;//if
  //
  sSQL := 'SELECT PPA.IDPESSOA, PPA.IDPESSJUR, PPA.IDPLANOPREV, PPA.IDPLANASS, CA.IDCONTASS, '+
                 'B.IDDEPENDENTE, CA.PAGADOR '+
            'FROM CONTRIBASS CA, PARTASS PPA, PLANASS PA, CONTRIBUICAO C, BENEFASS B ' +
           'WHERE (CA.PAGADOR  <> ' + '''E'') ';

  if Trim(strPatro) <> '' then
     sSqL := sSql + 'AND (PPA.IDPESSJUR IN (' + strPatro + ')) ';

  if Trim(strPlano) <> '' then
     sSql := sSql + 'AND (PA.IDPLANASS = ' + strPlano + ') ';

  if Trim(strContribuicao) <> '' then
     sSql := sSql + 'AND (CA.IDCONTASS = ' + strContribuicao + ') ';

  sSql := sSql + 'AND (CA.IDPLANASS = PPA.IDPLANASS) ' +
                 'AND (CA.IDPLANASS = PA.IDPLANASS) ' +
                 'AND (CA.IDCONTASS = C.IDCONTRIBUICAO) '+
                 'AND (PPA.IDPESSJUR = B.IDPESSJUR) '+
                 'AND (PPA.IDPESSOA = B.IDTITULAR) '+
                 'AND (PA.IDPLANASS = B.IDPLANASS) '+
                 'AND (PPA.IDPLANOPREV = B.IDPLANOPREV) '+
                 'AND NOT EXISTS (SELECT CO.IDPESSJUR '+
                                   'FROM CONTASS CO ' +
                                  'WHERE (CO.IDPESSJUR = PPA.IDPESSJUR) ' +
                                    'AND (CO.IDPLANOPREV = PPA.IDPLANOPREV) ' +
                                    'AND (CO.IDPLANASS = PPA.IDPLANASS) ' +
                                    'AND (CO.IDTITULAR = PPA.IDPESSOA) ' +
                                    'AND (CO.IDCONTASS = CA.IDCONTASS)) ';
  qryContribAssoc.Close;
  qryContribAssoc.SQL.Clear;
  qryContribAssoc.SQL.Add(sSQL);
  try
     qryContribAssoc.Open;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        MsgDlg('Erro na leitura das contribuições a associar. ',
               'Erro', mtError, [mbOk,mbHelp], 0);
        exit;
     end;
  end;

  bErro := False;
  qryContribAssoc.First;

  while not qryContribAssoc.Eof do
  begin
     // Define pagador
     if qryContribAssoc.FieldByName('PAGADOR').AsString = 'C' then
       sIdPagador := qryContribAssoc.FieldByName('IdPessoa').AsString
     else
       sIdPagador := qryContribAssoc.FieldByName('IdPessJur').AsString;

     // Insere todas as contribuições selecionadas a todos os participantes que ainda não
     // possuem essas contribuições
     sSQL := 'INSERT INTO CONTASS(IDPESSJUR, IDPLANOPREV, IDCONTASS, IDTITULAR,'+
                                 'IDPLANASS, IDDEPENDENTE, SEQPROPOSTA, IDPAGADOR, '+
                                 'FLGATIVO, FLGFOLHA, FLGCOBCARNE, PLANO) '+
              'VALUES ('+qryContribAssoc.FieldByName('IdPessJur').AsString+', '+
                         qryContribAssoc.FieldByName('IdPlanoPrev').AsString+', '+
                         qryContribAssoc.FieldByName('IdContAss').AsString+', '+
                         qryContribAssoc.FieldByName('IdPessoa').AsString+', '+
                         qryContribAssoc.FieldByName('IdPlanAss').AsString+', '+
                         qryContribAssoc.FieldByName('IdDependente').AsString+', '+
                         '1, ' + sIdPagador + ', 1, 0, 0, 999)';
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(sSql);
     try
        qryAux.ExecSQL;
     except
        raise;
        bErro := True;
     end;
     qryContribAssoc.Next;
  end;//while

  qryContribAssoc.Close;

  if bErro then
     MsgDlg('Erro na gravação das contribuições a associar. ','Erro',mtError,[mbOk,mbHelp],0)
  else
     MsgDlg('Associação Realizada com sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0);

  //Adaptacao para tirar o icone de SQL
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT 1 FROM DUAL');
     Open;
     Close;
  end;
end;

procedure TfrmAssocContribuicaoParticip.FormCreate(Sender: TObject);
begin
  inherited;
  qryPlano.Sql.Clear;
  qryPlano.Sql.Add('SELECT NOME, IDPLANASS '+
                     'FROM PLANASS '+
                    'ORDER BY NOME');
  //qryContribuicao.Sql.Clear;
  //qryContribuicao.Sql.Add('SELECT DISTINCT C.IDCONTRIBUICAO, C.NOME, C.FLGOBRIGATORIA ' +
  //                          'FROM CONTRIBUICAO C, CONTRIBASS CA, PLANPREVASS PPA ' +
  //                         'WHERE (C.IDCONTRIBUICAO = CA.IDCONTASS) ' +
  //                           'AND (CA.IDPLANASS = PPA.IDPLANASS) ' +
  //                           'AND (CA.PAGADOR <> ''E'') ' +
  //                         'ORDER BY C.NOME');
end;

procedure TfrmAssocContribuicaoParticip.rgTipoClick(Sender: TObject);
begin
  inherited;
  case rgTipo.ItemIndex of
    0: begin //selecionar
         chklstPatro.enabled        := true;
         chklstPlano.enabled        := true;
         chklstContribuicao.enabled := true;
       end;
    1: begin //todas
         chklstPatro.enabled        := false;
         chklstPlano.enabled        := false;
         chklstContribuicao.enabled := false;
       end;
  end;//case
end;

end.

