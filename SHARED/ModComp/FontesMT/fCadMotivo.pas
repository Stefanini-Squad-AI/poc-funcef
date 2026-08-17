unit fCadMotivo;


// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************

//***************************************************************************************
//Rotina             : bbtnConfirmarClick, dbrgGrupoClick, CmeCadastroEdit
//N. SIG..........   : 38475.59779
//Data da Alteração: : 06/12/2017
//Alteração Form:    : fCadMotivo
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Remoção da obrigatoriedade dos campos "Tabela eSocial" e
//										 "Campo eSocial".
//**************************************************************************************
//Rotina...........: .dfm,, bbtnConfirmarClick
//Nº SOL...........: 229353/16212
//Nº KINTANA/PPM...: 434575
//Data da Alteração: 21/09/2014
//Responsável......: Edilaine Ferraresi
//Descrição........: Inclusão campos para esocial
//***************************************************************************************
//Autor(a)   : Douglas Siqueira
//Data       : 21/12/2012
//Pendência  : SOL 108804 KTN 494141	
//Descricao  : Retirar visualização na Folha de Pagamento de dados de outros módulos, 
//tais como: layout de arquivos TXT, tabelas genéricas, rubricas, formas de cálculo etc.
// Menus: * Cadastro / Tabelas Auxiliares / Tabela REGRA/Forma de Cálculo - Forma de Cálculo
// e Tabela Genérica * Sistema / Utilitários / Layout de Arquivos TXT * Cadastros / Rubricas
// por Empresa * Cadastros / Rubricas Salariais * Cadastros / Motivos e Ações Impedir o mesmo
//acesso aos dados da folha por outros módulos.




interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, wwdbedit, Wwdatsrc,
  StdCtrls, ExtCtrls, DBCtrls, Mask, MontaSelect, Db, DBClient, uCMClientDataSet, ImgList,
  CmEventosCadastro, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  Grids, Wwdbigrd, Wwdbgrid, MConnect, SConnect, ObjBrkr, FCadastroMT, uCtrlMotivo,uCMTypes,
  Wwdotdot, Wwdbcomb;

type
  TfrmCadMotivo = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodigo: TDBEdit;
    Label2: TLabel;
    dbedDescr: TDBEdit;
    dbrgGrupo: TDBRadioGroup;
    Bevel1: TBevel;
    Label3: TLabel;
    dbedCodRais: TDBEdit;
    Label4: TLabel;
    dbedCodFgts: TDBEdit;
    Label5: TLabel;
    dbedObs: TwwDBEdit;
    dbcbxFlgAbateAvos: TDBCheckBox;
    dbedESocial: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cbTabESocial: TwwDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure dbrgGrupoClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbrgGrupoChange(Sender: TObject);
  private
    CtrlMotivo: TCtrlMotivo;
    procedure Sel(IdMotivo: integer);
    function GravarRegistro: boolean;
  end;

var
  frmCadMotivo: TfrmCadMotivo;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadMotivo.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);
  CtrlMotivo.Cds := Cds;
  Sel(-1);

  case (Sistema.IdModulo) of
    MODBAS : HelpContext := 690015;
    MODFOL : HelpContext := 210021;    
  end;
end;

procedure TfrmCadMotivo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlMotivo);
  inherited;
end;

procedure TfrmCadMotivo.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToInt(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadMotivo.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('GRUPOMOTIVO').asString := 'A';
end;

procedure TfrmCadMotivo.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadMotivo.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadMotivo.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadMotivo.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadMotivo.dsStateChange(Sender: TObject);
begin
  inherited;
  if (Cds.State in [dsInsert, dsEdit]) and (dbedCodigo.CanFocus) then
    dbedCodigo.SetFocus;
end;

procedure TfrmCadMotivo.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  //Cássio Rovaroto - SIG nº 38475.59779 - Início
  // edilaine SOL 229353/16212 / PPM 434575 - inicio
  if ((dbedESocial.enabled) and (dbedESocial.text = '')) and
  	 ((cbTabESocial.Enabled) and (cbTabESocial.ItemIndex <> -1)) then
  begin
    MsgDlg('Preencha o Código do eSocial.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedESocial.SetFocus;
    Exit;
  end;
  //else
  //if (cbTabESocial.enabled) and (cbTabESocial.itemIndex = -1) then
  //begin
  // MsgDlg('Preencha a Tabela do eSocial.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
  //  cbTabESocial.SetFocus;
  //end
  //else // edilaine SOL 229353/16212 / PPM 434575 - fim
  //Cássio Rovaroto - SIG nº 38475.59779 - Fim

  if (Trim(dbedCodigo.Text) = '') then
  begin
    MsgDlg('Preencha o Código.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedCodigo.SetFocus;
    Exit;
  end
  else
  if (Trim(dbedDescr.Text) = '') then
  begin
    MsgDlg('Preencha a Descrição.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    dbedDescr.SetFocus;
    Exit;
  end
  else
  begin
    bInserindo := (Cds.State = dsInsert);
    inherited;
    if not(bInserindo) then
      CmeCadastroFind(Sender);
  end;
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadMotivo.Sel(IdMotivo: integer);
begin
  Cds.Data := CtrlMotivo.ListGeral(IdMotivo, 0, '', '');
end;

function TfrmCadMotivo.GravarRegistro: boolean;
begin
  Cds.FieldByName('IDMODULO').asFloat:=21;//douglas.siqueira
  Result := CtrlMotivo.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlMotivo.MessageInfo);
end;

procedure TfrmCadMotivo.sbtnApagarClick(Sender: TObject);
begin
//Cds.edit;
//  inherited;

  if CmeCadastro.Operacao = opIdle then
   begin
        Try
          CmeCadastro.Operacao := opApagar;
          cds.edit;
          cds.post;
          if (MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes,mbNo],0) = mrYes) then
              CmeCadastro.Delete(Self);

          if cds.IsEmpty then
             CmeCadastro.Operacao := opVazio
          else
              CmeCadastro.Operacao := opIdle;

          CmeCadastro.AtualizaBotoes(Self);
        Except
          CmeCadastro.Operacao := opIdle;
          sbtnApagar.Down := False;
          {
          cds.DisableControls;
          cds.Close;
          cds.Open;
          cds.EnableControls;
          }
          Raise;
        End;
   end;

//    inherited;

end;

procedure TfrmCadMotivo.CmeCadastroDelete(Sender: TObject);
begin
  //inherited;
cds.edit;
  cds.Delete;
  If cds.State In [DsEdit,DsInsert] Then cds.Post;
  CtrlMotivo.Gravar;
end;

procedure TfrmCadMotivo.dbrgGrupoClick(Sender: TObject);
begin
  inherited;
  dbedESocial.Enabled  := (dbrgGrupo.ItemIndex = 1) or (dbrgGrupo.ItemIndex = 2);
  cbTabESocial.Enabled := (dbrgGrupo.ItemIndex = 1);

  if (dbrgGrupo.ItemIndex = 2) then
  //Cássio Rovaroto - SIG nº 38475.59779 - Início
  begin
     cbTabESocial.Enabled := True;
     cbTabESocial.ItemIndex := -1;
  end;
  //Cássio Rovaroto - SIG nº 38475.59779 - Fim

end;

procedure TfrmCadMotivo.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedESocial.Enabled  := (dbrgGrupo.ItemIndex = 1) or (dbrgGrupo.ItemIndex = 2);
  cbTabESocial.Enabled := (dbrgGrupo.ItemIndex = 1);

  //Cássio Rovaroto - SIG nº 38475.59779 - Início
  begin
     cbTabESocial.Enabled := True;
     cbTabESocial.ItemIndex := -1;
  end;
  //Cássio Rovaroto - SIG nº 38475.59779 - Fim
end;

procedure TfrmCadMotivo.dbrgGrupoChange(Sender: TObject);
begin
  inherited;
  dbedESocial.Enabled:= (dbrgGrupo.ItemIndex = 1) or (dbrgGrupo.ItemIndex = 2);
end;

end.
