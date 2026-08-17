{ Acertos nas consultas de Recebedor e Elegiveis }
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotina      :
// Autor(a)    : Gleyber
// Data        : 28/08/2002
// Alteração   : Diversos acertos nas Pendências:
//               8832, 8833, 8831, 8829, 8826.
//------------------------------------------------------------------------------
unit FConsPessoaGeralAdmPREV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Db, DBTables, Wwquery, Mask, DBCtrls,
  Grids, Wwdbigrd, Wwdbgrid;

Const
  vQL = #13+#10;

type
  TfrmConsPessoaGeralAdmPREV = class(TfrmSairAjuda)
    pgctrlBusca: TPageControl;
    tbsBusca: TTabSheet;
    pnlInscricao: TPanel;
    Label5: TLabel;
    pnlMatricula: TPanel;
    Label1: TLabel;
    pnlNome: TPanel;
    Label2: TLabel;
    pnlCPF: TPanel;
    Label3: TLabel;
    cmbMatricula: TComboBox;
    cmbInscricao: TComboBox;
    cmbNome: TComboBox;
    cmbCPF: TComboBox;
    edMatricula: TEdit;
    edInscricao: TEdit;
    edNome: TEdit;
    edCPF: TEdit;
    bbtnElegivel: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    bbtnDependente: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    bbtnBusca: TBitBtn;
    ToolbarSep973: TToolbarSep97;
    tbsResultado: TTabSheet;
    bbtnParticipante: TBitBtn;
    ToolbarSep975: TToolbarSep97;
    bbtnRecebedor: TBitBtn;
    ToolbarSep974: TToolbarSep97;
    qryElegivel: TwwQuery;
    dsElegivel: TDataSource;
    qryBusca: TwwQuery;
    bbtnBeneficiarioPP: TBitBtn;
    qryDep: TwwQuery;
    dsDep: TDataSource;
    dsRec: TDataSource;
    qryRec: TwwQuery;
    dsBen: TDataSource;
    qryBen: TwwQuery;
    qryBenpp: TwwQuery;
    dsBenpp: TDataSource;
    pnlResult: TPanel;
    Label4: TLabel;
    edTipoPessoa: TEdit;
    pgctrlResult: TPageControl;
    tbsElegivel: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Bevel1: TBevel;
    dbeMatriculaEL: TDBEdit;
    dbeInscPlanEL: TDBEdit;
    dbeCpfEL: TDBEdit;
    dbeNomeEL: TDBEdit;
    dbePatroEL: TDBEdit;
    dbeSitPatroEL: TDBEdit;
    dbePlanPrevEL: TDBEdit;
    dbeSitPlanoEL: TDBEdit;
    dbeSitFuncEL: TDBEdit;
    dbeNascEL: TDBEdit;
    DbeSexoEL: TDBEdit;
    tbsDependente: TTabSheet;
    grbTitular: TGroupBox;
    Label20: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    dbeNomeTitDP: TDBEdit;
    dbeMatriculaDP: TDBEdit;
    dbeCPFTitDP: TDBEdit;
    dbeNascTitDP: TDBEdit;
    dbeSexoTitDP: TDBEdit;
    grbDepedente: TGroupBox;
    Label19: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    dbeNomeDepDP: TDBEdit;
    dbeEstCivilDP: TDBEdit;
    dbeCPFDepDP: TDBEdit;
    dbeNascDepDP: TDBEdit;
    dbeSexoDepDP: TDBEdit;
    tbsRecebedor: TTabSheet;
    GroupBox1: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    dbeNomeRC: TDBEdit;
    dbeEstCivilRC: TDBEdit;
    dbeCpfRC: TDBEdit;
    dbeNascRC: TDBEdit;
    dbeSexoRC: TDBEdit;
    dbgDepRec: TwwDBGrid;
    tbsBenefPP: TTabSheet;
    Panel2: TPanel;
    Label33: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    dbeNomeBP: TDBEdit;
    dbeCpfBP: TDBEdit;
    dbeMantBP: TDBEdit;
    Panel3: TPanel;
    dbgBen: TwwDBGrid;
    dbgResultado: TwwDBGrid;
    qryRes: TwwQuery;
    dsRes: TDataSource;
    qryAux: TwwQuery;
    qryPart: TwwQuery;
    dbeMatrBP: TDBEdit;
    Label34: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnBuscaClick(Sender: TObject);
    procedure dbgResultadoDblClick(Sender: TObject);
    procedure bbtnDependenteClick(Sender: TObject);
    procedure bbtnElegivelClick(Sender: TObject);
    procedure bbtnBeneficiarioPPClick(Sender: TObject);
    procedure bbtnRecebedorClick(Sender: TObject);
    procedure pgctrlBuscaChange(Sender: TObject);
    procedure qryBenAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    bElegivel,
    bParticipante,
    bDependente,
    bBeneficiario,
    bBenefAss,
    bRecebedor,
    bBenefpp        : boolean;

    procedure SetaTiposPessoa(sIdPessoa : string; sIdPessjur : string = '');
    procedure PreencheDados  (sIdPessoa : string; sIdPessjur : string = '');
    procedure MontaQuery     ( sTodos    : string);
    function TextoFiltro(sTexto, sCampo : string; iItem : Integer) : String;

  public
    { Public declarations }
  end;

var
  frmConsPessoaGeralAdmPREV: TfrmConsPessoaGeralAdmPREV;

implementation

uses FCadDepenBenef, FTelaAut, FCadElegivel, FCadBeneficiarioPP,
  FCadResponsa;

{$R *.DFM}

procedure TfrmConsPessoaGeralAdmPREV.SetaTiposPessoa(sIdPessoa : string; sIdPessjur : string = '');
Var
 sTodos,
 sSql    : String;
begin
// Caso o parâmetro passado seja -1 (não localizou ninguém)
  if sIdPessoa = '-1' Then
   Begin
    ShowMessage('NENHUMA PESSOA FOI LOCALIZADA COM ESTES PARÂMETROS.');
    Abort;
   End;
// Se o parâmetro sIdPessjur for nulo, altera para forma correta
   If sIdPessjur = ''
    Then sIdPessjur := 'NULL';
//
  If qryBusca.RecordCount > 1
    Then
     Begin
      // Exibir resultado
      tbsResultado.TabVisible   := True;
      pgctrlBusca.ActivePage    := tbsResultado;
      //
      dbgResultado.BringToFront;
      qryBusca.First;
      // Avalia se Resultado for igual a um - neste caso roda direto resultado.
      If qryBusca.RecordCount > 1000  Then
       Begin
        ShowMessage('NÚMERO MÁXIMO DE 1000 LINHAS ATINGIDO. REFORMULE CONSULTA.');
        pgctrlBuscaChange(Self);
        Exit;
       End;
      //
      While not qryBusca.Eof do
       Begin
        If sTodos <> '' Then sTodos := sTodos + ', ';
        sTodos := sTodos + qryBusca.Fields[0].AsString;
        qryBusca.Next;
       End;
      MontaQuery(sTodos);
      Abort;
     End;

   if (Trim(sIdPessoa) <> '') and (StrtoInt(sIdPessoa) <= 0)
   then begin
      bElegivel      := False;
      bParticipante  := False;
      bDependente    := False;
      bBeneficiario  := False;
      bBenefAss      := False;
      bRecebedor     := False;
      bBenefpp       := False;
      Exit;
   end;

   with qryBusca do
   begin
      // VERIFICAR SE PESSOA É ELEGIVEL
      Close;
      SQL.Clear;
// Gleyber - 29/08/2002
      SQL.Add('SELECT IDPESSOA, IDPESSJUR FROM ELEGPATRO WHERE IDPESSOA = '+sIdPessoa);
//
      If sIdPessjur <> 'NULL'
       Then SQL.Add(' AND IDPESSJUR = '+sIdPessjur);
      Open;

      If RecordCount > 1
       Then SetaTiposPessoa(sIdPessoa);

      if not IsEmpty
       then
        Begin
         bElegivel := True;
         // Habilita a pasta do Elegível
         tbsElegivel.TabVisible    := True;
         tbsElegivel.Caption:='Dados do Elegível';
// Gleyber - 29/08/2002
         sIdPessjur := FieldByName('IDPESSJUR').AsString;
//
        End;


      // VERIFICAR SE PESSOA É PARTICIPANTE
      Close;
      SQL.Clear;
      sSql := 'SELECT IDPESSOA, FLGINTERNO'+ vQl +
              'FROM PARTPREVPLAN PV, SITPART  SP'+ vQl +
              'WHERE IDPESSOA = '+sIdPessoa+ vQl +
              '  AND FLGDESATIVADO = 0'+ vQl +
              '  AND PV.IDSITPART = SP.IDSITPART';
      If sIdPessjur <> 'NULL'
       Then sSql := sSql + vQl + '  AND IDPESSJUR = '+sIdPessjur;
      SQL.Add(sSql);
      Open;

      if not IsEmpty then
       if FieldByName('FLGINTERNO').AsString = 'AS'
        Then
         begin
          bBenefAss := True;
          // Habilita a pasta do Beneficiário
          tbsBenefPP.TabVisible    := True;
          tbsBenefPP.Caption:='Dados do Benefício';
          // Desabilita Elegivel
          bElegivel              := False;
          tbsElegivel.TabVisible := False;
          // Acerta componentes
          Label36.Visible           := False;
          dbeMantBP.Visible         := False;
          dbeNomeBP.DataSource      := dsBen;
          dbeMatrBP.DataSource      := dsBen;
          dbeCpfBP.DataSource       := dsBen;
          dbgBen.DataSource         := dsBen;
         end
        Else
         begin
          bParticipante := True;
          // Habilita a pasta do Participante
          tbsElegivel .TabVisible    := True;
          tbsElegivel.Caption:='Dados do Participante';
          // Desabilita Elegivel
          bElegivel              := False;
         end;

      // VERIFICAR SE PESSOA É DEPENDENTE
      Close;
      SQL.Clear;
      SQL.Add('SELECT IDPESSOA FROM DEPENTIT WHERE IDPESSOA = '+sIdPessoa+' AND IDDEPENDENCIA <> ''PRP''');
      Open;

      if not IsEmpty
      then
        begin
         bDependente := True;
         // Habilita a pasta do Dependente
         tbsDependente.TabVisible    := True;
         tbsDependente.Caption:='Dados do Dependente';
        end;

      // VERIFICAR SE PESSOA É RESPONSAVEL(RECEBEDOR)
      Close;
      SQL.Clear;
      sSQL:= 'SELECT RE.IDRESPONSAVEL '+
             'FROM BFCIARIOTITPLAN BT, RESPONSAVEL RE '+
             'WHERE RE.IDRESPONSAVEL = '+sIdPessoa +' '+
             '  AND BT.IDRESPONSAVEL = RE.IDRESPONSAVEL ' +
             '  AND RE.FLGADMPREV = 1 ' +
             '  AND BT.IDRESPONSAVEL <> BT.IDPESSOA  ';
      SQL.Add(sSQL);

     Open;

      if not IsEmpty
       then
        begin
         bRecebedor  := True;
         // Habilita a pasta do Recebedor
         tbsRecebedor.TabVisible  := True;
         tbsRecebedor.Caption:='Dados do Recebedor';
        end;


      // VERIFICAR SE PESSOA É BENEFICIARIO
      Close;
      SQL.Clear;
      sSql := 'SELECT IDTITULAR, IDPESSOA ' + vQL +
              'FROM BENEFBFCIARIO ' + vQL +
              'WHERE IDPESSOA = ' + sIdPessoa + vQL +
              '  AND IDSITBENEFICIO = 1' + vQL +
              '  AND IDTITULAR <> IDPESSOA';
      SQL.Add(sSql);
      Open;

      if not IsEmpty
       then
        begin
         bBeneficiario := True;
         bDependente   := False;
         // Habilita a past do Beneficiário e desabilita Beneficiario
         tbsBenefPP.TabVisible    := True;
         tbsDependente.TabVisible := False;
         tbsBenefPP.Caption:='Dados do Benefício';
         // Acerta componentes
         Label36.Visible           := False;
         dbeMantBP.Visible         := False;
         dbeNomeBP.DataSource      := dsBen;
         dbeMatrBP.DataSource      := dsBen;
         dbeCpfBP.DataSource       := dsBen;
         dbgBen.DataSource         := dsBen;
        end;


      // VERIFICAR SE PESSOA É BENEFICIÁRIO DE OUTRA EMPRESA (POSTO PRISMA)
      Close;
      SQL.Clear;
      SQL.Add('SELECT IDBENEFICIARIOPP FROM BENEFICIARIOPP WHERE IDBENEFICIARIOPP = '+sIdPessoa);
      Open;

      if not IsEmpty
       then
        begin
         bBenefPP := True;
         // Habilita a pasta do Beneficiário
         tbsBenefPP.TabVisible    := True;
         tbsBenefPP.Caption:='Dados do Beneficiário Posto Prisma';
         // Acerta componentes
         Label36.Visible           := True;
         dbeMantBP.Visible         := True;
         dbeNomeBP.DataSource      := dsBenpp;
         dbeMatrBP.DataSource      := dsBenpp;
         dbeCpfBP.DataSource       := dsBenpp;
         dbgBen.DataSource         := dsBenpp;
        end;
   end;

   // Habilita ou desabilita botões

   bbtnElegivel.Enabled       := bElegivel;
   bbtnParticipante.Enabled   := (bParticipante) or (bBenefAss);
   bbtnDependente.Enabled     := bDependente;
   bbtnRecebedor.Enabled      := bRecebedor;
   bbtnBeneficiarioPP.Enabled := (bBenefpp) or (bBeneficiario);

   PreencheDados(sIdPessoa, sIdPessjur);

end;

procedure TfrmConsPessoaGeralAdmPREV.PreencheDados  (sIdPessoa : string; sIdPessjur : string = '');
var sDescTipoPessoa : string;
begin
// Se o parâmetro sIdPessjur for nulo, altera para forma correta

   // Preencher o tipo de pessoa
   sDescTipoPessoa := '';

   if bElegivel and (not bParticipante)
   then sDescTipoPessoa := sDescTipoPessoa+', Elegível';

   if bParticipante
   then sDescTipoPessoa := sDescTipoPessoa+', Participante';

   if bDependente
   then sDescTipoPessoa := sDescTipoPessoa+', Dependente';

   if bBeneficiario
   then sDescTipoPessoa := sDescTipoPessoa+', Beneficiário';

   if bBenefAss
   then sDescTipoPessoa := sDescTipoPessoa+', Participante Assistido';

   if bRecebedor
   then sDescTipoPessoa := sDescTipoPessoa+', Recebedor';

   if bBenefpp
   then sDescTipoPessoa := sDescTipoPessoa+', Beneficiário Não Associado';

   if Trim(sDescTipoPessoa) <> ''
   then sDescTipoPessoa := Copy(sDescTipoPessoa, 3, Length(sDescTipoPessoa));

   edTipoPessoa.Text         := sDescTipoPessoa;

   // Exibir resultado
   tbsResultado.TabVisible   := True;
   pgctrlBusca.ActivePage    := tbsResultado;

   // Exibir dados resultado

   // Elegivel
   If bElegivel Then
    Begin
     qryElegivel.Close;
     qryElegivel.ParamByName('IDPESSOA').AsInteger:=StrToInt(sIdpessoa);
     qryElegivel.ParamByName('IDPESSJUR').AsInteger:=StrToInt(sIdpessjur);
     qryElegivel.Open;
     dsElegivel.DataSet:=qryElegivel;
    End;

   // Participante
   If (bParticipante) or (bBenefAss) Then
    Begin
     qryPart.Close;
     qryPart.ParamByName('IDPESSOA').AsInteger:=StrToInt(sIdpessoa);
     qryPart.Open;
     dsElegivel.DataSet:=qryPart;
    End;

   // Dependente
   If bDependente Then
    Begin
     qryDep.Close;
     qryDep.ParamByName('IDPESSOA').AsInteger:=StrToInt(sIdpessoa);
     qryDep.Open;
    End;

   // Recebedor
   If bRecebedor Then
    Begin
     qryRec.Close;
     qryRec.ParamByName('IDPESSOA').AsInteger:=StrToInt(sIdpessoa);
     qryRec.Open;
    End;

   // Beneficiario
   If (bBeneficiario) or (bBenefAss) Then
    Begin
     qryBen.Close;
     qryBen.ParamByName('IDPESSOA').AsInteger:=StrToInt(sIdpessoa);
     qryBen.Open;
    End;

   // Beneficiario Posto Prisma
   If bBenefpp Then
    Begin
     qryBenpp.Close;
     qryBenpp.ParamByName('IDPESSOA').AsInteger:=StrToInt(sIdpessoa);
     qryBenpp.Open;
    End;
end;

procedure TfrmConsPessoaGeralAdmPREV.FormShow(Sender: TObject);
begin
  inherited;
  pnlResult.BringToFront;
  pgctrlBusca.ActivePage    := tbsBusca;
  cmbMatricula.ItemIndex    := 0;
  cmbInscricao.ItemIndex    := 0;
  cmbNome.ItemIndex         := 0;
  cmbCPF.ItemIndex          := 0;
  edMatricula.Text          := '';
  edInscricao.Text          := '';
  edNome.Text               := '';
  edCPF.Text                := '';
  bbtnElegivel.Enabled      := False;
  bbtnParticipante.Enabled  := False;
  bbtnDependente.Enabled    := False;
  bbtnRecebedor.Enabled     := False;
  bbtnBeneficiarioPP.Enabled:= False;
  tbsResultado.TabVisible   := False;
  tbsElegivel.TabVisible    := False;
  tbsDependente.TabVisible  := False;
  tbsRecebedor.TabVisible   := False;
  tbsBenefPP.TabVisible     := False;
  bElegivel     := False;
  bParticipante := False;
  bDependente   := False;
  bBeneficiario := False;
  bBenefAss     := False;
  bRecebedor    := False;
  bBenefpp      := False;
  edMatricula.SetFocus;
end;

procedure TfrmConsPessoaGeralAdmPREV.bbtnBuscaClick(Sender: TObject);
var
  sIdPessoa,
  sIdPessjur,
  sFiltro,
  sSQL        : String;
begin
  inherited;
//
  sSQL          := '';
  bElegivel     := False;
  bParticipante := False;
  bDependente   := False;
  bBeneficiario := False;
  bBenefAss     := False; 
  bRecebedor    := False;
  bBenefpp      := False;
//
  tbsElegivel.TabVisible    := False;
  tbsDependente.TabVisible  := False;
  tbsRecebedor.TabVisible   := False;
  tbsBenefPP.TabVisible     := False;
//
//   Início - Tratamento de Busca a partir de Matrícula
//
  if Trim(edMatricula.Text) <> ''
  then begin
     sFiltro := TextoFiltro('MATRICULA',edMatricula.Text,cmbMatricula.ItemIndex);

     if Trim(edInscricao.Text) <> ''
     then sFiltro := sFiltro + TextoFiltro(' AND PP.INSCRICAONUMERO',edInscricao.Text,cmbInscricao.ItemIndex);

     if Trim(edNome.Text) <> ''
     then sFiltro := sFiltro + TextoFiltro(' AND P.NOME',edNome.Text,cmbNome.ItemIndex);

     if Trim(edCPF.Text) <> ''
     then sFiltro := sFiltro + TextoFiltro(' AND P.NUMDOCUMENTO',edCPF.Text,cmbCPF.ItemIndex);

     // VERIFICAR SE EXISTE ELEGIVEL COM ESTA MATRICULA
     sSQL := 'SELECT P.IDPESSOA, PP.IDPLANOPREV, EL.IDPESSJUR '+ vQl +
             'FROM   PESSOA P, PESSOAFISICA PF, ELEGPATRO EL, PARTPREVPLAN PP '+ vQl +
             'WHERE  '+sFiltro+ vQl +
             // cguedes - 05/07/2002
//             'AND    PP.IDSITPART = 1 '+ vQl + { Augusto - 24/07/2002 }
             'AND    P.IDPESSOA   = EL.IDPESSOA        '+ vQl +
             'AND    P.IDPESSOA   = PF.IDPESSOA        '+ vQl +
             'AND    P.TIPO       = ''F''              '+ vQl +
             'AND    EL.IDPESSJUR = PP.IDPESSJUR(+)    '+ vQl +
             'AND    EL.IDPESSOA  = PP.IDPESSOA(+)     '+ vQl +
             'AND    0            = PP.FLGDESATIVADO(+)'+ vQl;

     If (Trim(edMatricula.Text) <> '') and
        (Trim(edInscricao.Text) =  '') and
        (Trim(edNome.Text)      =  '') and
        (Trim(edCPF.Text)       =  '')
      Then sSql := sSql +
                  'UNION '+ vQl +
                  'SELECT DT.IDPESSOA, PP.IDPLANOPREV, PP.IDPESSJUR'+ vQl +
                  'FROM DEPENTIT DT, PARTPREVPLAN PP'+ vQl +
                  'WHERE '+sFiltro+ vQl +
                  'AND   DT.IDTITULAR = PP.IDPESSOA';
     with qryBusca do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Open;

        If RecordCount > 1
         Then SetaTiposPessoa(sIdPessoa);

        if not IsEmpty
        then begin
           sIdPessoa := FieldByName('IDPESSOA').AsString;
           sIdPessjur:= FieldByName('IDPESSJUR').AsString;

           SetaTiposPessoa(sIdPessoa,sIdPessjur);
           Exit;
        end;

     end;

     // SE NAO ENCONTROU NADA, PROCURAR NA TABELA DE DEPENDENTE
     sFiltro := TextoFiltro('DP.MATRICULA',edMatricula.Text,cmbMatricula.ItemIndex);

     if Trim(edInscricao.Text) <> ''
     then sFiltro := sFiltro + TextoFiltro(' AND PP.INSCRICAONUMERO',edInscricao.Text,cmbInscricao.ItemIndex);

     if Trim(edNome.Text) <> ''
     then sFiltro := sFiltro + TextoFiltro(' AND P.NOME',edNome.Text,cmbNome.ItemIndex);

     if Trim(edCPF.Text) <> ''
     then sFiltro := sFiltro + TextoFiltro(' AND P.NUMDOCUMENTO',edCPF.Text,cmbCPF.ItemIndex);

     sSQL := ' SELECT P.IDPESSOA '+ vQl +
             ' FROM   PESSOA P, DEPENTIT DP, PARTPREVPLAN PP '+ vQl +
             ' WHERE  '+sFiltro+ vQl +
             ' AND    P.IDPESSOA   = DP.IDPESSOA     '+ vQl +
             ' AND    P.TIPO       = ''F''           '+ vQl +
             ' AND    DP.IDTITULAR = PP.IDPESSOA(+)  '+ vQl +
             ' AND    PP.FLGDESATIVADO= 0               ';
     with qryBusca do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Open;

        If RecordCount > 1
         Then SetaTiposPessoa(sIdPessoa);

        if not IsEmpty
        then begin
            sIdPessoa := FieldByName('IDPESSOA').AsString;
            SetaTiposPessoa(sIdPessoa);
            Exit;
        end
     end;
  end
//
//   Fim - Tratamento de Busca a partir de Matrícula
//
  else
//
//   Início - Tratamento de Busca a partir de Número de Inscrição
//
  if Trim(edInscricao.Text) <> ''
  then begin
     sFiltro := TextoFiltro('PP.INSCRICAONUMERO',edInscricao.Text,cmbInscricao.ItemIndex);

     if Trim(edNome.Text) <> ''
     then sFiltro := sFiltro + TextoFiltro(' AND P.NOME',edNome.Text,cmbNome.ItemIndex);

     if Trim(edCPF.Text) <> ''
     then sFiltro := sFiltro + TextoFiltro(' AND P.NUMDOCUMENTO',edCPF.Text,cmbCPF.ItemIndex);

     // VERIFICAR SE EXISTE PARTICIPANTE COM ESTA INSCRIÇÃO
     sSQL := ' SELECT P.IDPESSOA, PP.IDPLANOPREV '+ vQl +
             ' FROM   PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP '+ vQl +
             ' WHERE  '+sFiltro+ vQl +
             ' AND    P.IDPESSOA   = EL.IDPESSOA  '+ vQl +
             ' AND    P.TIPO       = ''F''        '+ vQl +
             ' AND    EL.IDPESSJUR = PP.IDPESSJUR '+ vQl +
             ' AND    EL.IDPESSOA  = PP.IDPESSOA  '+ vQl +
             ' AND    PP.FLGDESATIVADO= 0            ';
     with qryBusca do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Open;

        If RecordCount > 1
         Then SetaTiposPessoa(sIdPessoa);

        if not IsEmpty
        then begin
           sIdPessoa := FieldByName('IDPESSOA').AsString;

           SetaTiposPessoa(sIdPessoa);
           Exit;
        end;

     end;
  end
//
//   Fim - Tratamento de Busca a partir de Número de Inscrição
//
  else
//
//   Início - Tratamento de Busca a partir de Nome
//
  if Trim(edNome.Text) <> ''
  then begin
     sFiltro := TextoFiltro(' AND P.NOME',edNome.Text,cmbNome.ItemIndex);

     if Trim(edCPF.Text) <> ''
     then sFiltro := sFiltro + TextoFiltro(' AND P.NUMDOCUMENTO',edCPF.Text,cmbCPF.ItemIndex);

     // VERIFICAR SE EXISTE PESSOA COM ESTE NOME
     sSQL := ' SELECT P.IDPESSOA             '+ vQl +
             ' FROM   PESSOA P               '+ vQl +
             ' WHERE  P.TIPO       = ''F''   '+ vQl +
             sFiltro ;
     with qryBusca do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Open;

        If RecordCount > 1
         Then SetaTiposPessoa(sIdPessoa);

        if not IsEmpty
        then begin
           sIdPessoa := FieldByName('IDPESSOA').AsString;
           // VERIFICAR SE PESSOA É PARTICIPANTE
           Close;
           SQL.Clear;
           SQL.Add('SELECT IDPESSOA FROM PARTPREVPLAN WHERE IDPESSOA = '+sIdPessoa+' AND FLGDESATIVADO= 0');
           Open;

        If RecordCount > 1
         Then SetaTiposPessoa(sIdPessoa);

           If not IsEmpty
           then begin
               sIdPessoa := FieldByName('IDPESSOA').AsString;
               SetaTiposPessoa(sIdPessoa);
               Exit;
           end;

           // VERIFICAR SE PESSOA É ELEGIVEL
           Close;
           SQL.Clear;
           SQL.Add('SELECT IDPESSOA, IDPESSJUR FROM ELEGPATRO WHERE IDPESSOA = '+sIdPessoa);
           Open;

           If RecordCount > 1
            Then SetaTiposPessoa(sIdPessoa);

           if not IsEmpty
           then begin
               sIdPessoa := FieldByName('IDPESSOA').AsString;
               SetaTiposPessoa(sIdPessoa);
               Exit;
           end;

           // VERIFICAR SE PESSOA É DEPENDENTE
           Close;
           SQL.Clear;
           SQL.Add('SELECT IDPESSOA FROM DEPENTIT WHERE IDPESSOA = '+sIdPessoa+' AND IDDEPENDENCIA <> ''PRP''');
           Open;

           If RecordCount > 1
            Then SetaTiposPessoa(sIdPessoa);

           if not IsEmpty
           then begin
              sIdPessoa := FieldByName('IDPESSOA').AsString;
              SetaTiposPessoa(sIdPessoa);
              Exit;
           end;

           // VERIFICAR SE PESSOA É RESPONSAVEL(RECEBEDOR)
           Close;
           SQL.Clear;
           SQL.Add('SELECT IDRESPONSAVEL FROM RESPONSAVEL WHERE IDRESPONSAVEL = '+
                    sIdPessoa+' AND FLGADMPREV = 1 ');
           Open;

           If RecordCount > 1
            Then SetaTiposPessoa(sIdPessoa);

           if not IsEmpty
           then begin
              sIdPessoa := FieldByName('IDRESPONSAVEL').AsString;
              SetaTiposPessoa(sIdPessoa);
              Exit;
           end;
        end;

     end;
  end
//
//   Fim - Tratamento de Busca a partir de Nome
//

  else
//
//   Início - Tratamento de Busca a partir do CPF
//
  if Trim(edCPF.Text) <> ''
  then begin
     sFiltro := TextoFiltro(' AND P.NUMDOCUMENTO',edCPF.Text,cmbCPF.ItemIndex);

     // VERIFICAR SE EXISTE PESSOA COM ESTE CPF
     sSQL := ' SELECT P.IDPESSOA '+ vQl +
             ' FROM   PESSOA P '+ vQl +
             ' WHERE  P.TIPO       = ''F''        '+ vQl +
             sFiltro ;
     with qryBusca do
     begin
        Close;
        SQL.Clear;
        SQL.Add(sSQL);
        Open;

        If RecordCount > 1
         Then SetaTiposPessoa(sIdPessoa);

        if not IsEmpty
        then begin
           sIdPessoa := FieldByName('IDPESSOA').AsString;
           // VERIFICAR SE PESSOA É PARTICIPANTE
           Close;
           SQL.Clear;
           SQL.Add('SELECT IDPESSOA FROM PARTPREVPLAN WHERE IDPESSOA = '+sIdPessoa+' AND FLGDESATIVADO= 0');
           Open;

           If RecordCount > 1
            Then SetaTiposPessoa(sIdPessoa);

           if not IsEmpty
           then begin
               sIdPessoa := FieldByName('IDPESSOA').AsString;
               SetaTiposPessoa(sIdPessoa);
               Exit;
           end;

           // VERIFICAR SE PESSOA É ELEGIVEL
           Close;
           SQL.Clear;
           SQL.Add('SELECT IDPESSOA, IDPESSJUR FROM ELEGPATRO WHERE IDPESSOA = '+sIdPessoa);
           Open;

           If RecordCount > 1
            Then SetaTiposPessoa(sIdPessoa);

           if not IsEmpty
           then begin
               sIdPessoa := FieldByName('IDPESSOA').AsString;
               SetaTiposPessoa(sIdPessoa);
               Exit;
           end;

           // VERIFICAR SE PESSOA É DEPENDENTE
           Close;
           SQL.Clear;
           SQL.Add('SELECT IDPESSOA FROM DEPENTIT WHERE IDPESSOA = '+sIdPessoa+' AND IDDEPENDENCIA <> ''PRP''');
           Open;

           If RecordCount > 1
            Then SetaTiposPessoa(sIdPessoa);

           if not IsEmpty
           then begin
              sIdPessoa := FieldByName('IDPESSOA').AsString;
              SetaTiposPessoa(sIdPessoa);
              Exit;
           end;

           // VERIFICAR SE PESSOA É RESPONSAVEL(RECEBEDOR)
           Close;
           SQL.Clear;
           SQL.Add('SELECT IDRESPONSAVEL FROM RESPONSAVEL WHERE IDRESPONSAVEL = '+
                   sIdPessoa + '  AND FLGADMPREV = 1 ');
           Open;

           If RecordCount > 1
            Then SetaTiposPessoa(sIdPessoa);

           if not IsEmpty
           then begin
              sIdPessoa := FieldByName('IDRESPONSAVEL').AsString; { Augusto 24/07/2002 }
              SetaTiposPessoa(sIdPessoa);
              Exit;
           end;
        end;

     end;
  end;
//
//   Fim - Tratamento de Busca a partir do CPF
//

//
//   Tratamento dado para o caso de não preencher nenhum campo
//
  If qryBusca.RecordCount=0 Then
   Begin
      sIdPessoa := '-1';
      SetaTiposPessoa(sIdPessoa);
      Exit;
   end;
end;

function TfrmConsPessoaGeralAdmPREV.TextoFiltro(sTexto, sCampo: string;
  iItem: Integer): String;
begin
 case iItem of
      0 : TextoFiltro := sTexto +' LIKE '''+Trim(sCampo)+'%''';
      1 : TextoFiltro := sTexto +' =    '''+Trim(sCampo)+'''';
      2 : TextoFiltro := sTexto +' LIKE ''%'+Trim(sCampo)+'%''';
 end;
end;

procedure TfrmConsPessoaGeralAdmPREV.MontaQuery(sTodos: string);
Var
 sSql      :  String;
begin
 With qryRes do
  Begin
   Close;
   SQL.Clear;
   sSql :=   'SELECT DISTINCT                                    '+ vQl +
             ' PE.IDPESSOA,                                      '+ vQl +
             ' PE.NOME,                                          '+ vQl +
             ' DECODE(EL.MATRICULA, NULL, DT.MATRICULA, EL.MATRICULA) AS MATRICULA,'+ vQl +
             ' EL.IDPESSJUR,                                     '+ vQl +
             ' PV.INSCRICAONUMERO,                               '+ vQl +
             ' PE.NUMDOCUMENTO                                   '+ vQl +
             'FROM                                               '+ vQl +
             ' PESSOA         PE,                                '+ vQl +
             ' ELEGPATRO      EL,                                '+ vQl +
             ' DEPENTIT       DT,                                '+ vQl +
             ' PARTPREVPLAN   PV                                 '+ vQl +
             'WHERE                                              '+ vQl +
             '-- FILTRO PESSOA                                   '+ vQl +
             ' (PE.IDPESSOA       IN ('+sTodos+')     )  AND     '+ vQl +
             '-- JOIN PESSOA COM ELEGPATRO                       '+ vQl +
             ' (PE.IDPESSOA       =     EL.IDPESSOA(+))  AND     '+ vQl +
             '-- JOIN  ELEGPATRO COM PARTPREVPLAN                '+ vQl +
             ' (EL.IDPESSOA       =     PV.IDPESSOA(+))  AND     '+ vQl +
             ' (EL.IDPESSJUR      =    PV.IDPESSJUR(+))  AND     '+ vQl +
             '-- JOIN  DEPENTIT COM PESSOA                       '+ vQl +
             ' (DT.IDPESSOA       =     PE.IDPESSOA   )  AND     '+ vQl +
             '-- JOIN  DEPENTIT COM DEPENTIT                     '+ vQl +
             ' (DT.IDTITULAR      =     DT.IDTITULAR  )  AND     '+ vQl +
             ' (DT.IDDEPENDENCIA  =   DT.IDDEPENDENCIA)          '+ vQl;
   if Trim(edMatricula.Text) <> ''
   then sSql := sSql + '  AND ((' + TextoFiltro('DT.MATRICULA',edMatricula.Text,cmbMatricula.ItemIndex)+ vQl +
                       '        OR ' + TextoFiltro('EL.MATRICULA',edMatricula.Text,cmbMatricula.ItemIndex)+'))';


   SQL.Add(sSql);
   Open;
// Avalia se Resultado for igual a um - neste caso roda direto resultado.
   If RecordCount = 1
    Then dbgResultadoDblClick(Self);
  End;
end;

procedure TfrmConsPessoaGeralAdmPREV.dbgResultadoDblClick(Sender: TObject);
begin
  inherited;
  // Exibir resultado
  pgctrlBusca.ActivePage    := tbsResultado;
  pnlResult.BringToFront;
  // Altera a query de busca
  qryBusca.Close;
  qryBusca.SQL.Clear;
  qryBusca.SQL.Add('SELECT IDPESSOA FROM PESSOA WHERE IDPESSOA = '+qryRes.FieldByName('IDPESSOA').AsString);
  qryBusca.Open;
  // Roda a funcção para o setar o tipo Pessoa
  SetaTiposPessoa(qryRes.FieldByName('IDPESSOA').AsString,
                  qryRes.FieldByName('IDPESSJUR').AsString);
end;

procedure TfrmConsPessoaGeralAdmPREV.bbtnDependenteClick(Sender: TObject);
begin
  inherited;
  // Abre o Form de Dependente
  AbrirForm(frmCadDepenBenef,TfrmCadDepenBenef,true);
  //
  With frmCadDepenBenef do
   Begin
    SelecionaDependente(qryDep.FieldByName('IDTITULAR').AsString,
                        qryDep.FieldByName('IDPESSJUR').AsString,
                        qryDep.FieldByName('IDPLANOPREV').AsString);
  //
    sbtnProcurar.Enabled := False;
   End;
end;

procedure TfrmConsPessoaGeralAdmPREV.bbtnElegivelClick(Sender: TObject);
Var
 iIdPessoa : Integer;
begin
  inherited;
  IniciaEventoInscricao(qryAux, '-1','Cadastro de Elegível e Participante', True);
//  If qryElegivel.Active
//   Then iIdpessoa := qryElegivel.FieldByName('IDPESSOA').AsInteger
//   Else iIdPessoa := qryPart.FieldByName('IDPESSOA').AsInteger;
  iIdpessoa := dsElegivel.DataSet.FieldByName('IDPESSOA').AsInteger;
  frmCadElegivel.Pessoa.ChangePessoa(iIdPessoa);
end;

procedure TfrmConsPessoaGeralAdmPREV.bbtnBeneficiarioPPClick(Sender: TObject);
begin
  inherited;
  If bBeneficiario
   Then
    Begin
     AbrirForm(frmCadDepenBenef,TfrmCadDepenBenef,true);
     //
     With frmCadDepenBenef do
      Begin
       SelecionaDependente(qryBen.FieldByName('IDTITULAR').AsString,
                           qryBen.FieldByName('IDPESSJUR').AsString,
                           qryBen.FieldByName('IDPLANOPREV').AsString);
     //
       sbtnProcurar.Enabled := False;
      End;
    End
   Else
    Begin
     Try
      AbrirForm(FrmCadBeneficiarioPP,TFrmCadBeneficiarioPP,true);
      FrmCadBeneficiarioPP.Pessoa.ChangePessoa(qryBenpp.FieldByName('IDPESSOA').AsInteger);
     Finally
      WindowState:= wsNormal;
     End;
    End;
end;

procedure TfrmConsPessoaGeralAdmPREV.bbtnRecebedorClick(Sender: TObject);
begin
  inherited;
//  AbrirForm(frmCadResponsa,TfrmCadResponsa,true);

  frmCadResponsa := TfrmCadResponsa.Create(Application);
  frmCadResponsa.Pessoa.ChangePessoa(qryRec.FieldByName('IDTITULAR').AsInteger);

  try
   frmCadResponsa.ShowModal;
  finally
   frmCadResponsa.Free;
  end;
end;

procedure TfrmConsPessoaGeralAdmPREV.pgctrlBuscaChange(Sender: TObject);
begin
  inherited;
  FormShow(Self);
end;

procedure TfrmConsPessoaGeralAdmPREV.qryBenAfterOpen(DataSet: TDataSet);
begin
  inherited;
  If Trim(qryBen.FieldByName('IDDEPENDENCIA').AsString)='PRP'
   Then dbeMatrBP.DataField := 'MATRICULA_TITULAR'
   Else dbeMatrBP.DataField := 'MATRICULA_DEPENDENTE'
end;

end.
