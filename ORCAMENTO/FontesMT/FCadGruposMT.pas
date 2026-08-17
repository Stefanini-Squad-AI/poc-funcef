// Alterações:
{
--------------------------------------------------------------------------------
// Rotina........: CmeCadastroFind
// Autor.........: Helen Bianchi / Edilaine Ferraresi
// Data..........: 15/08/2012
// Nº SOL........: 187700
// Nº KINTANA....: 1767662
--------------------------------------------------------------------------------------------------
// Rotina........: CmeCadastroApplyEdit
// Autor.........: Edilaine Ferraresi
// Data..........: 02/07/2012
// Nº SOL........: 161099
// Nº KINTANA....: 1715076
// Descrição.....: melhoria na alteração e exclusão de grupos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Rotina........: *.DFM, Diversas (troca de Modulo.iPlanoOrc por iIdPlanoOrc)
// Autor.........: Edilaine Ferraresi
// Data..........: 23/03/2012
// Nº SOL........: 172383-7764
// Nº KINTANA....: 1556975
// Descrição.....: Adicionado parâmetro de Plano orçamentario
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Diversas
Data      : 30/09/2005
Autor     : Rodolpho da Silva
Pendencia : 20372
Descrição : Correção na rotina em que ao incluir um novo grupo de contas, a árvore estava "sumindo".
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : VerificaCodigoFinalZero
Data      : 10/05/2004
Autor     : Marchetti
Pendencia : 16362
Descrição : Rotina para verificar se o Codigo digitado temseu final igual a zero, respeitando o número
            de dígitos na máscara, conforme sua posicao
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 07/11/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Filtro dos grupos pelo Plano Orçamentário (IDPLANOORCAMEN) / Modulo.iPlanoOrc
---------------------------------------------------------------------------------------------------}


{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
unit FCadGruposMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMT, ComCtrls, CMTree, StdCtrls, DBCtrls, ExtCtrls, wwdbedit,
   Buttons, Mask, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, uCtrlCadGrupos, uCMTreeViewMT, uCMTypes,
   wwdblook, CMDBLookupCombo, uCmSqlParams,
   uCtrlCadFormulaApuraOrc, IBDatabase;

type
   TItem = record
      CodGrupoOrc  : string;
      NomeGrupoOrc : string;
      FlgAnaSint   : string;
   end;

   pItem = ^TItem;

   TfrmCadGruposMT = class(TFrmCadastroMT)
      pnlEdicao: TPanel;
      Label2: TLabel;
      Label3: TLabel;
      dbedDescricao: TDBEdit;
      pnAnaSint: TPanel;
      sbtnAnalitico: TSpeedButton;
      sbtnSintetico: TSpeedButton;
      dbedCod: TwwDBEdit;
      dbrdgSinal: TDBRadioGroup;
      dbckResultado: TDBCheckBox;
      Panel1: TPanel;
      dblckFormOrcado: TCMDBLookupCombo;
      Label4: TLabel;
      cdsFormOrcado: TCMClientDataSet;
      CMSql: TCMSqlParams;
      cdsFormOrcadoIDFORMORCADO: TFloatField;
      cdsFormOrcadoNOME: TStringField;
      cdsFormOrcadoDESCRICAO: TMemoField;
      cdsFormOrcadoBASEARREDONDAMENTO: TStringField;
      cdsFormOrcadoBASECALCULO: TStringField;
      TrvGrupos: TTreeView;
      imgTreeView: TImageList;
    cdsPlanoOrc: TCMClientDataSet;
    Label5: TLabel;
    cboPlanoOrc: TCMDBLookupCombo;
    cdsArv: TCMClientDataSet;

      procedure FormCreate(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure CmeCadastroCancel(Sender: TObject);
      procedure CmeCadastroEdit(Sender: TObject);
      procedure dbedCodExit(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
      procedure CdsAfterScroll(DataSet: TDataSet);
      procedure CmeCadastroConfirma(Sender: TObject);
      procedure sbtnAnaliticoClick(Sender: TObject);
      procedure sbtnSinteticoClick(Sender: TObject);
      procedure CmeCadastroFind(Sender: TObject);
      procedure CmeCadastroDelete(Sender: TObject);
      procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure sbtnApagarClick(Sender: TObject);
      procedure TrvGruposChange(Sender: TObject; Node: TTreeNode);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dbedCodEnter(Sender: TObject);
    procedure cboPlanoOrcChange(Sender: TObject);
    procedure dbedDescricaoEnter(Sender: TObject);
    procedure dbrdgSinalEnter(Sender: TObject);
    procedure dbckResultadoEnter(Sender: TObject);
    procedure dblckFormOrcadoEnter(Sender: TObject);
    procedure cdsArvAfterScroll(DataSet: TDataSet);


   private  // Private declarations

      CtrlCadGrupos : TCtrlCadGrupos;
      CtrlCadFormOrcado: TCtrlCadFormulaApuraOrc;

      bMontandoArvore : Boolean;
      Mascara  : String;
      iIdPlanoOrc : integer;  // Edilaine - SOL 172383-7764 / KTN 1556975
      procedure HabilitaInsercao; // Edilaine - SOL 172383-7764 / KTN 1556975
      procedure VerificarPlanoPreenchido(bExit : boolean); // Edilaine - SOL 172383-7764 / KTN 1556975

      function VerificaCodigoFinalZero : Boolean;

      function  InserePasta(bEumaPasta: Boolean; Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem): TTreeNode;
      function  RetornaCod(sCod: string): string;
      procedure InserePapel (Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem);
      procedure MontaArvore(cCds : TClientDataSet);     // Edilaine - SOL 172383-7764 / KTN 1556975
      procedure AcharNo(sCod: string);

   public   // Public declarations

   end;



var
  frmCadGruposMT: TfrmCadGruposMT;



implementation
{$R *.DFM}
uses
   uMensErro, uDatabase, DBaseDados, uSistema, uModulo;



procedure TfrmCadGruposMT.FormCreate(Sender: TObject);
begin
   inherited;

   // Edilaine - SOL 172383-7764 / KTN 1556975 - comentada linha
   //MontaSelect.Filtro.Add('GRUPOORCAMEN.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));

   CtrlCadGrupos := TCtrlCadGrupos.Create;
   CtrlCadGrupos.Initialize(DtmBaseDados.dbBaseDados, True,
                            Sistema.ConnectionType,   Sistema.ConnectionSide,
                            Sistema.AppRemoteServer,  True, nil, nil, False);

   CtrlCadFormOrcado := TCtrlCadFormulaApuraOrc.Create;
   CtrlCadFormOrcado.InitializeAs(CtrlCadGrupos);

   CtrlCadGrupos.CdsCadGrupos := Cds;
   // Edilaine - SOL 172383-7764 / KTN 1556975
   iIdPlanoOrc := -1;
   Cds.Data := CtrlCadGrupos.BuscaTodos( iIdPlanoOrc {Modulo.iPlanoOrc});

   cdsPlanoOrc.Data := CtrlCadGrupos.ListaPlanoOrcamento;
   // Edilaine - SOL 172383-7764 / KTN 1556975 - fim


   // Edilaine - SOL 172383-7764 / KTN 1556975 - comentado
   {
   //Pega a máscara de formatação da tabela de parâmetros
   if (not CtrlCadGrupos.PesquisaMascara(Sistema.IdEmpresa, Mascara)) then begin
      MsgDlg('Máscara Inválida','Erro',mtError,[mbOk],0);
      Repaint;
      Exit;
   end;

   Cds.FieldByName('CODGRUPOORC').EditMask := Mascara + ';0; ';
   }

   MontaArvore(Cds);   // Edilaine - SOL 172383-7764 / KTN 1556975 - acrescentado parametro cds
   Cds.First;


   cdsFormOrcado.Data := CtrlCadFormOrcado.ListaFormulaApuraOrc;

   pnlEdicao.Enabled  := False;
   sbtnSintetico.Down := True;
end;



procedure TfrmCadGruposMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(CtrlCadFormOrcado);

  CtrlCadGrupos.Free;
end;

//************************************************


// Edilaine Ferraresi - SOL 172383-7764 / KTN 1556975
procedure TfrmCadGruposMT.HabilitaInsercao;
begin
  cds.EmptyDataSet;
  cds.Insert;

  if (Cds.FieldByName('FLGANALSINT').AsString = 'S') then
  begin
    Cds.FieldByName('IDFORMORCADO').Clear;
    dblckFormOrcado.Enabled := False;
  end
  else
  begin
    dblckFormOrcado.Enabled := True;
  end;

  Cds.FieldByName('FLGSINALGRUPO').AsString   := 'P';
  Cds.FieldByName('FLGRESULTADO').AsString    := 'N';

  
  Cds.FieldByName('FLGANALSINT').AsString := 'S';
  sbtnSintetico.Down := True;

  dblckFormOrcado.Enabled := False;
  Cds.FieldByName('IDFORMORCADO').Clear;
end;
// Edilaine Ferraresi - SOL 172383-7764 / KTN 1556975 - fim


procedure TfrmCadGruposMT.CmeCadastroInsert(Sender: TObject);
begin
  // Edilaine Ferraresi - SOL 172383-7764 / KTN 1556975 - comentado
  {inherited;

  if (Cds.FieldByName('FLGANALSINT').AsString = 'S') then
    begin
      Cds.FieldByName('IDFORMORCADO').Clear;
      dblckFormOrcado.Enabled := False;
    end
  else
    begin
      dblckFormOrcado.Enabled := True;
    end;

  Cds.FieldByName('FLGSINALGRUPO').AsString   := 'P';
  Cds.FieldByName('FLGRESULTADO').AsString    := 'N';
  }
  // Edilaine Ferraresi - SOL 172383-7764 / KTN 1556975 - fim

  TrvGrupos.Enabled := False;
  pnlEdicao.Enabled := True;
  dbedCod.Enabled   := True;
  cboPlanoOrc.enabled := true; // Edilaine - SOL 161099 / KTN 1715076

  // Edilaine - SOL 172383-7764 / KTN 1556975
  //dbedCod.SetFocus;
  trvGrupos.items.clear;
  cboPlanoOrc.Clear;
  cboPlanoOrc.SetFocus;
  dbedCod.clear; // Text := '';
  dbedDescricao.clear; //Text := '';
  //sbtnSinteticoClick(Self);
  // Edilaine - SOL 172383-7764 / KTN 1556975 - fim
end;
//************************************************



procedure TfrmCadGruposMT.CmeCadastroCancel(Sender: TObject);
begin
  // Edilaine - SOL 161099 / KTN 1715076
  if (CmeCadastro.Operacao = opInserir) then
  begin
    cds.EmptyDataSet;
    TrvGrupos.Items.clear;
    cboPlanoOrc.Clear;
  end;
  // Edilaine - SOL 161099 / KTN 1715076 - fim

  inherited;
  TrvGrupos.Enabled := True;
  pnlEdicao.Enabled := false;

  sbtnAlterar.enabled := not cds.isEmpty;  // Edilaine - SOL 161099 / KTN 1715076
  sbtnApagar.enabled  := not cds.isEmpty;  // Edilaine - SOL 161099 / KTN 1715076
end;
//************************************************



procedure TfrmCadGruposMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedCod.Enabled := False;

  if (Cds.FieldByName('FLGANALSINT').AsString = 'S') then
    begin
      Cds.FieldByName('IDFORMORCADO').Clear;
      dblckFormOrcado.Enabled := False;
    end
  else
    begin
      dblckFormOrcado.Enabled := True;
    end;

  if (Cds.FieldByName('FLGSINALGRUPO').isNull) then
    begin
      Cds.FieldByName('FLGSINALGRUPO').AsString   := 'P';
    end;

  if (Cds.FieldByName('FLGRESULTADO').IsNull) then
    begin
      Cds.FieldByName('FLGRESULTADO').AsString := 'N';
    end;

  cboPlanoOrc.enabled := false; // Edilaine - SOL 161099 / KTN 1715076
  TrvGrupos.Enabled := False;
  pnlEdicao.Enabled := True;
  dbedDescricao.SetFocus;
end;
//************************************************



procedure TfrmCadGruposMT.dbedCodExit(Sender: TObject);
var
  iGrau    : Integer;
  lSair    : Boolean;
  lEnabled : Boolean;
  sPai     : String;
begin

  try
    inherited;

    sPai                 := '';
    lEnabled             := True;
    lSair                := False;
    iGrau                := 0;

    if (Trim((dbedCod.Text)) <> '') then begin

      iGrau := CtrlCadGrupos.CalcGrau(Trim(dbedCod.Text),
                                       CtrlCadGrupos.Nivel,
                                       CtrlCadGrupos.ind,
                                       sPai);
      // Edilaine - SOL 172383-7764 / KTN 1556975 - trocar Modulo.iPlanoOrc por iIdPlanoOrc
      if (sPai <> '') and not CtrlCadGrupos.PodeSerAnalitico(sPai, iIdPlanoOrc {Modulo.iPlanoOrc}) then begin
         MsgDlg('Não é possível cadastrar um Grupo Analítico abaixo de outro Grupo Analítico.','Erro',mtError,[mbOk],0);
         Repaint;
         lSair := true;
      end;

      if (iGrau = 0) then begin
         MsgDlg('Máscara Inválida','Erro',mtError,[mbOk],0);
         Repaint;
         lSair := true;
      end;

      // Edilaine - SOL 172383-7764 / KTN 1556975 - trocar Modulo.iPlanoOrc por iIdPlanoOrc
      if (iGrau > 1) and (CtrlCadGrupos.VerificaCodigo(sPai, iIdPlanoOrc {Modulo.iPlanoOrc})) then
      begin
         MsgDlg('Código Pai não Cadastrado','Erro',mtError,[mbOk],0);
         Repaint;
         lSair := true;
      end;
    end;

    if (Cds.State = dsInsert) And
       (not lSair)            And
       (Trim((dbedCod.Text)) <> '')then begin

      //Verifica a duplicidade do código
      // Edilaine - SOL 172383-7764 / KTN 1556975 - trocar Modulo.iPlanoOrc por iIdPlanoOrc
      if (not CtrlCadGrupos.VerificaCodigo(dbedCod.text, iIdPlanoOrc {Modulo.iPlanoOrc})) then
      begin
        MsgDlg('Já existe um Grupo com este código.', 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
        lSair := true;
      end;

    end;

    if (lSair) then begin

      dbEdCod.Text := '';
      dbEdCod.EditText := '';
      Cds.FieldByName('CODGRUPOORC').EditMask := Mascara + ';0; ';
      Cds.FieldByName('CODGRUPOORC').AsString := '';
      dbedCod.SetFocus;
      exit;
    end;

    //Controla os botões de sinalização de grupo Analítico ou Sintético
    if (iGrau = 1) and (CtrlCadGrupos.ind + 1 > 1) then begin

      sbtnSintetico.Down  := True;
      Cds.FieldByName('FLGANALSINT').AsString := 'S';
      lEnabled := false;
    end;

    if (iGrau = CtrlCadGrupos.ind + 1) then begin

      sbtnAnalitico.Down  := True;
      Cds.FieldByName('FLGANALSINT').AsString := 'A';
      lEnabled := false;
    end;

    pnAnaSint.Enabled := lEnabled;

  except Raise;
  end;
end;



procedure TfrmCadGruposMT.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  Accept := False;

  if (Cds.FieldByName('FLGANALSINT').AsString = 'S') and
     (dblckFormOrcado.Text <> '') then
    begin
      MsgDlg('Não é permitido cadastrar Fórmula de Apuração para Grupos Sintéticos!','Atenção',mtError,[mbOk],0);
      Repaint;
      if dblckFormOrcado.Enabled = False then
        dblckFormOrcado.Enabled := True;
      dblckFormOrcado.SetFocus;
      EXIT;
    end;

  if (dbedCod.Text  = '') then
    begin
      MsgDlg('Obrigatório preenchimento do código da Conta','Atenção',mtError,[mbOk],0);
      Repaint;
      dbedCod.SetFocus;
      EXIT;
    end;

  if (dbedDescricao.Text  = '') then
    begin
      MsgDlg('Obrigatório preenchimento da descrição do Grupo de Contas','Atenção',mtError,[mbOk],0);
      Repaint;
      dbedDescricao.SetFocus;
      EXIT;
    end;

  if Cds.State = dsInsert then
    begin
      // Verifica a duplicidade do código
      // Edilaine - SOL 172383-7764 / KTN 1556975 - trocar Modulo.iPlanoOrc por iIdPlanoOrc
      if not(CtrlCadGrupos.VerificaCodigo(dbedCod.text, iIdPlanoOrc {Modulo.iPlanoOrc})) then
        begin
          MsgDlg('Já existe um Grupo com este código.','Aviso',mtWarning,[mbOk],0);
          Repaint;
          dbedCod.SetFocus;
          EXIT;
        end;
    end;

  Accept := True;

  inherited;
end;



procedure TfrmCadGruposMT.CdsAfterScroll(DataSet: TDataSet);
begin
  inherited;

  if not bMontandoArvore then
    begin
      if (Cds.FieldByName('FLGANALSINT').AsString = 'A') then
        begin
          sbtnAnalitico.Down := True;
          dblckFormOrcado.Enabled := True;
        end
      else
        begin
          if (Cds.FieldByName('FLGANALSINT').AsString = 'S') then
            begin
              sbtnSintetico.Down := True;
              dblckFormOrcado.Enabled := False;
            end;
        end;
    end;
end;



procedure TfrmCadGruposMT.CmeCadastroConfirma(Sender: TObject);
begin
   if Cds.State in [DsEdit,DsInsert] then
     begin
      // Edilaine - SOL 172383-7764 / KTN 1556975 - trocar Modulo.iPlanoOrc por iIdPlanoOrc
        Cds.FieldByName('IDPLANOORCAMEN').AsFloat := iIdPlanoOrc;  //Modulo.iPlanoOrc;

        // Preenche o campo de Analítico ou Sintético
        if sbtnAnalitico.Down then
          begin
            Cds.FieldByName('FLGANALSINT').AsString := 'A';
          end
        else
          begin
            Cds.FieldByName('FLGANALSINT').AsString := 'S';
            Cds.FieldByName('IDFORMORCADO').Clear;
          end;
     end;

   inherited;
end;



procedure TfrmCadGruposMT.sbtnAnaliticoClick(Sender: TObject);
begin
  inherited;
  // Edilaine - SOL 172383-7764 / KTN 1556975
  VerificarPlanoPreenchido(true);

  Cds.FieldByName('FLGANALSINT').AsString := 'A';
  sbtnAnalitico.Down := True;

  dblckFormOrcado.Enabled := True;
end;



procedure TfrmCadGruposMT.sbtnSinteticoClick(Sender: TObject);
begin
  inherited;
  // Edilaine - SOL 172383-7764 / KTN 1556975
  VerificarPlanoPreenchido(true);

  Cds.FieldByName('FLGANALSINT').AsString := 'S';
  sbtnSintetico.Down := True;

  dblckFormOrcado.Enabled := False;
  Cds.FieldByName('IDFORMORCADO').Clear;
end;

procedure TfrmCadGruposMT.CmeCadastroFind(Sender: TObject);
var
  sGrupo : string; // Edilaine - SOL 172383-7764 / KTN 1556975
begin
   inherited;
   if MontaSelect.RetornouValor then
   begin
      Repaint;

      cdsPlanoOrc.Data := CtrlCadGrupos.ListaPlanoOrcamento;   // Helen - SOL 187700 /KTN 1767662

      // Edilaine - SOL 172383-7764 / KTN 1556975
      cboPlanoOrc.LookupValue := MontaSelect.ValoresChave[1];
      iIdPlanoOrc := StrToInt(MontaSelect.ValoresChave[1]);
      // Edilaine - SOL 172383-7764 / KTN 1556975 - fim

      //pendência 26644 - 22/11/2007
      // Edilaine - SOL 172383-7764 / KTN 1556975 - trocar Modulo.iPlanoOrc por iIdPlanoOrc
      Cds.Data := CtrlCadGrupos.BuscaTodos(iIdPlanoOrc {Modulo.iPlanoOrc});
      Cds.FieldByName('CODGRUPOORC').EditMask := Mascara + ';0; ';
      Cds.Locate('IDGRUPOORCAMEN', MontaSelect.ValoresChave[0],[]);
      sGrupo := Cds.FieldByName('CODGRUPOORC').AsString;  // Edilaine - SOL 172383-7764 / KTN 1556975

      // Edilaine - SOL 172383-7764 / KTN 1556975
      MontaArvore(cds);
      
      AcharNo(sGrupo);
   end;
end;



procedure TfrmCadGruposMT.CmeCadastroDelete(Sender: TObject);
begin
   // Verifica se existem grupo filhos para proceder com a deleção
   if (TrvGrupos.Selected.HasChildren) then
   begin
      MsgDlg('O Grupo de Contas Orçamentárias possui Filho(s)','Atenção',mtWarning,[mbok],0);
      Repaint;
   end
   else
   begin
      inherited;
   end;
end;



procedure TfrmCadGruposMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   pnlFundo.enabled := true;
end;



procedure TfrmCadGruposMT.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
   if not(CtrlCadGrupos.CadGruposInclui(Cds.FieldByName('NOMEGRUPOORCAMEN').AsString,
                                        FormatFloat('#0', iIdPlanoOrc {Modulo.iPlanoOrc}),  // Edilaine - SOL 172383-7764 / KTN 1556975
                                        Cds.FieldByName('FLGSINALGRUPO').AsString,
                                        Cds.FieldByName('FLGRESULTADO').AsString,
                                        Cds.FieldByName('FLGANALSINT').AsString,
                                        Cds.FieldByName('CODGRUPOORC').AsString,
                                        Cds.FieldByName('IDFORMORCADO').AsString)) then
     begin
       MsgDlg(CtrlCadGrupos.MessageInfo, 'Erro', mtError, [ mbOk ], 0);
       Repaint;
     end
   else
     begin
       inherited;
       // Edilaine - SOL 172383-7764 / KTN 1556975 - trocar Modulo.iPlanoOrc por iIdPlanoOrc
       Cds.Data := CtrlCadGrupos.BuscaTodos(iIdPlanoOrc {Modulo.iPlanoOrc});
       Cds.FieldByName('CODGRUPOORC').EditMask := Mascara + ';0; ';
       pnlEdicao.Enabled := false;
       MontaArvore(cds);    // Edilaine - SOL 172383-7764 / KTN 1556975 - acrescentado parametro cds
       Cds.First;
     end;
end;



procedure TfrmCadGruposMT.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
var
   sGrupo   : string;   // Edilaine - SOL 161099 / KTN 1715076
   iIdGrupo : integer;  // Edilaine - SOL 161099 / KTN 1715076
begin
  sGrupo   := Cds.FieldByName('CODGRUPOORC').AsString;      // Edilaine - SOL 161099 / KTN 1715076
  iIdGrupo := Cds.FieldByName('IDGRUPOORCAMEN').AsInteger;  // Edilaine - SOL 161099 / KTN 1715076

  if not CtrlCadGrupos.CadGruposAltera(Cds.FieldByName('NOMEGRUPOORCAMEN').AsString,
                                       Cds.FieldByName('FLGSINALGRUPO').AsString,
                                       Cds.FieldByName('FLGRESULTADO').AsString,
                                       Cds.FieldByName('FLGANALSINT').AsString,
                                       Cds.FieldByName('CODGRUPOORC').AsString,
                                       Cds.FieldByName('IDGRUPOORCAMEN').AsFloat,
                                       Cds.FieldByName('IDFORMORCADO').AsString) then
     begin
       MsgDlg(CtrlCadGrupos.MessageInfo, 'Erro', mtError, [ mbOk ], 0);
       Repaint;
       pnlEdicao.Enabled := false; // Edilaine - SOL 161099 / KTN 1715076
     end
   else
     begin
       inherited;
       // Edilaine - SOL 172383-7764 / KTN 1556975 - trocar Modulo.iPlanoOrc por iIdPlanoOrc
       Cds.Data := CtrlCadGrupos.BuscaTodos(iIdPlanoOrc {Modulo.iPlanoOrc});
       Cds.FieldByName('CODGRUPOORC').EditMask := Mascara + ';0; ';

       // Edilaine - SOL 161099 / KTN 1715076
       MontaArvore(cds);
       AcharNo(sGrupo);
       Cds.Locate('IDGRUPOORCAMEN', iIdGrupo,[]);  
       //Cds.First;
       // Edilaine - SOL 161099 / KTN 1715076 - FIM

       TrvGrupos.Enabled := True;
       pnlEdicao.Enabled := false;
     end;
end;



procedure TfrmCadGruposMT.sbtnApagarClick(Sender: TObject);
begin
   if (mrOk = Msgdlg('Confirma exclusão', 'Confirmação', mtConfirmation, [ mbOk, mbCancel ], 0)) then
   begin
      Repaint;

    if not CtrlCadGrupos.CadGruposExclui(Cds.FieldByName('IDGRUPOORCAMEN').AsFloat) then
    begin

      MsgDlg(CtrlCadGrupos.MessageInfo, 'Erro', mtError, [ mbOk ], 0);
      Repaint;
    end else begin
      TrvGrupos.Selected.Delete;
      MsgDlg('Exclusão realizada com sucesso.','Informacao', mtInformation, [mbOk], 0);  // Edilaine - SOL 161099 / KTN 1715076
    end;
  end;
  bbtnCancelarClick(Self);
end;

function TfrmCadGruposMT.VerificaCodigoFinalZero : Boolean;
var
   iNumDigitos    : Integer;
   iValorDigitado : Integer;
   iTamanho       : Integer;
begin
   iTamanho       := Length(dbedcod.Text);
   iNumDigitos    := CtrlCadGrupos.Nivel[iTamanho];
   iValorDigitado := StrToInt(Copy(dbedcod.Text,iTamanho,iNumDigitos));

   if      (iNumDigitos = 1) and (iValorDigitado = 0) then Result := False
   else if (iNumDigitos > 1) and (iValorDigitado = 0) then Result := False
   else                                                    Result := True;
end;



procedure TfrmCadGruposMT.InserePapel(Arvore: TTreeView;
  NoDestino: TTreeNode; pDesc: pItem);
var
  No: TTreeNode;

begin
  No := Arvore.Items.AddChildObject(NoDestino,pDesc.NomeGrupoOrc,pDesc);
  No.ImageIndex    := 2;
  No.SelectedIndex := 3;
end;




function TfrmCadGruposMT.InserePasta(bEumaPasta: Boolean;
  Arvore: TTreeView; NoDestino: TTreeNode; pDesc: pItem): TTreeNode;
var
  No: TTreeNode;

begin
  if bEumaPasta then
    No := Arvore.Items.AddObject(NoDestino,pDesc.NomeGrupoOrc,pDesc)
  else
    No := Arvore.Items.AddChildObject(NoDestino,pDesc.NomeGrupoOrc,pDesc);
  No.ImageIndex    := 0;
  No.SelectedIndex := 1;
  Result := No;
end;




procedure TfrmCadGruposMT.MontaArvore(cCds : TClientDataSet);
var
  ItemNo      : pItem;
  No          : TTreeNode;
  sCodPaiGrup : string;

begin
   try
      TrvGrupos.Items.Clear;
      No := TrvGrupos.Items.GetFirstNode;
      bMontandoArvore := true;

      // Edilaine - SOL 172383-7764 / KTN 1556975 - trocar de  cds  para  cCds
      cCds.First;
      sCodPaiGrup := cCds.FieldByName('CODGRUPOORC').AsString;

      while not cCds.Eof do
      begin
         new(ItemNo);
         ItemNo.CodGrupoOrc  := cCds.FieldByName('CODGRUPOORC').AsString;
         ItemNo.NomeGrupoOrc := RetornaCod(cCds.FieldByName('CODGRUPOORC').DisplayText) + ' - ' + cCds.FieldByName('NOMEGRUPOORCAMEN').AsString;
         ItemNo.FlgAnaSint   := cCds.FieldByName('FLGANALSINT').AsString;

         if (No <> nil) then
         begin
            while pItem(No.Data)^.CodGrupoOrc <> Copy(cCds.FieldByName('CODGRUPOORC').AsString,1,Length(pItem(No.Data)^.CodGrupoOrc)) do
            begin
               if sCodPaiGrup = Copy(cCds.FieldByName('CODGRUPOORC').AsString,1,Length(sCodPaiGrup)) then
                  No := No.Parent
               else
               begin
                  sCodPaiGrup := cCds.FieldByName('CODGRUPOORC').AsString;
                  No          := nil;
                  Break;
               end;
            end;
         end;

         if ItemNo.FlgAnaSint = 'S' then
            No := InserePasta(False, TrvGrupos,No,ItemNo)
         else
            InserePapel(TrvGrupos,No,ItemNo);

         cCds.Next;
      end;
      // Edilaine - SOL 172383-7764 / KTN 1556975 - fim da troca

   finally
      bMontandoArvore := False;
      ItemNo := nil;
   end;

end;




function TfrmCadGruposMT.RetornaCod(sCod: string): string;
var
  i: integer;
begin
   for i := Length(sCod) downto 1 do
   begin
      if sCod[i] in ['0'..'9'] then
      begin
         Result := Copy(sCod,1,i);
         Break
      end;
   end;

end;




procedure TfrmCadGruposMT.TrvGruposChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  if (not bMontandoArvore) then
     Cds.Locate('CODGRUPOORC',pItem(TrvGrupos.Selected.Data)^.CodGrupoOrc,[]);
end;




procedure TfrmCadGruposMT.AcharNo(sCod: string);
var
  No: TTreeNode;
begin
   TrvGrupos.Selected := TrvGrupos.Items.GetFirstNode;

   while (Trim(pItem(TrvGrupos.Selected.Data)^.CodGrupoOrc) <> Trim(sCod)) do
   begin
      if Trim(pItem(TrvGrupos.Selected.Data)^.CodGrupoOrc) = Copy(sCod,1,Length(pItem(TrvGrupos.Selected.Data)^.CodGrupoOrc)) then
         TrvGrupos.Selected := TrvGrupos.Selected.GetNext
      else
         TrvGrupos.Selected := TrvGrupos.Selected.getNextSibling;
      if TrvGrupos.Selected = nil then Break;
   end;
end;

procedure TfrmCadGruposMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;

  // Edilaine - SOL 161099 / KTN 1715076 - COMENTADO
  //pendência 26644 - 22/11/2007
  // Edilaine - SOL 172383-7764 / KTN 1556975 - trocar Modulo.iPlanoOrc por iIdPlanoOrc
  //Cds.Data := CtrlCadGrupos.BuscaTodos(iIdPlanoOrc {Modulo.iPlanoOrc});
  //Cds.FieldByName('CODGRUPOORC').EditMask := Mascara + ';0; ';

end;

procedure TfrmCadGruposMT.dbedCodEnter(Sender: TObject);
begin
  // Edilaine - SOL 172383-7764 / KTN 1556975
  VerificarPlanoPreenchido(false);
end;



procedure TfrmCadGruposMT.VerificarPlanoPreenchido(bExit : boolean);
begin
  // Edilaine - SOL 172383-7764 / KTN 1556975
  if (cboPlanoOrc.text = '') then
  begin
    MsgDlg('Obrigatório o preenchimento do Plano Orçamentário','Aviso',mtWarning,[mbOk],0);
    cboPlanoOrc.setfocus;

    if bExit then
       abort;
  end;
  // Edilaine - SOL 172383-7764 / KTN 1556975 - fim
end;

procedure TfrmCadGruposMT.cboPlanoOrcChange(Sender: TObject);
begin
  inherited;
  // Edilaine - SOL 172383-7764 / KTN 1556975
  iIdPlanoOrc := -1;
  if (cboPlanoOrc.text <> '') then
  begin
    if cboPlanoOrc.LookUpValue <> '' then
       iIdPlanoOrc := StrToInt( cboPlanoOrc.LookUpValue );

    Mascara := cdsPlanoOrc.FieldByName('MASCARAGRUPO').AsString;

    //Pega a máscara de formatação da tabela de parâmetros
    if (not CtrlCadGrupos.PesquisaMascara(Sistema.IdEmpresa, Mascara)) then
    begin
      MsgDlg('Máscara Inválida','Erro',mtError,[mbOk],0);
      Repaint;
      Exit;
    end;

    if iIdPlanoOrc > 0 then
    begin
      CdsArv.Data := CtrlCadGrupos.BuscaTodos( iIdPlanoOrc {Modulo.iPlanoOrc});
      MontaArvore(CdsArv);
    end;

    if (CmeCadastro.Operacao = opInserir) and (cds.State <> dsInsert) then
       HabilitaInsercao;

    if (cds.State = dsInsert) then
       Cds.FieldByName('CODGRUPOORC').EditMask := Mascara + ';0; ';
       
  end;
  // Edilaine - SOL 172383-7764 / KTN 1556975 - fim
end;


procedure TfrmCadGruposMT.dbedDescricaoEnter(Sender: TObject);
begin
  // Edilaine - SOL 172383-7764 / KTN 1556975
  VerificarPlanoPreenchido(false);
end;

procedure TfrmCadGruposMT.dbrdgSinalEnter(Sender: TObject);
begin
  // Edilaine - SOL 172383-7764 / KTN 1556975
  VerificarPlanoPreenchido(false);
end;

procedure TfrmCadGruposMT.dbckResultadoEnter(Sender: TObject);
begin
  // Edilaine - SOL 172383-7764 / KTN 1556975
  VerificarPlanoPreenchido(false);
end;

procedure TfrmCadGruposMT.dblckFormOrcadoEnter(Sender: TObject);
begin
  // Edilaine - SOL 172383-7764 / KTN 1556975
  VerificarPlanoPreenchido(false);
end;

procedure TfrmCadGruposMT.cdsArvAfterScroll(DataSet: TDataSet);
begin
  // Edilaine - SOL 172383-7764 / KTN 1556975
  if not bMontandoArvore then
    begin
      if (CdsArv.FieldByName('FLGANALSINT').AsString = 'A') then
        begin
          sbtnAnalitico.Down := True;
          dblckFormOrcado.Enabled := True;
        end
      else
        begin
          if (CdsArv.FieldByName('FLGANALSINT').AsString = 'S') then
            begin
              sbtnSintetico.Down := True;
              dblckFormOrcado.Enabled := False;
            end;
        end;
    end;
  // Edilaine - SOL 172383-7764 / KTN 1556975 - fim
end;

end.

