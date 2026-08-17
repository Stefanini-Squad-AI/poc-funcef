{***************************************************************
 *
 * Unit Name: FCadImpostos
 * Purpose  : Cadastro de Impostos
 * Author   : Gabriel W Farinas
 * History  : Retirado componente treeview
 *            corrigido update da qry
 *            separado cadastro de conta contabil para credito e para debito
 *            Inicializada variavel integraback.plano no form principal
 *            SubConta corresponde à conta contabil que obrigue subconta
 *
 ****************************************************************}
 {****************************************************************************
     Última Atualização     : 22/09/1998
     Módulo                 : Cadastro de Impostos
     Autor                  : Luiz Carlos de Novaes
     Pendencias             : Erro no Retorno da Autorizacao.IdEmpresa (-1);
                        Como pegar o campo "CONTACREDITO"
                        Como pegar o campo "CONTADEBITO"
                        Como pegar o campo "TRATAMENTO"
*****************************************************************************}


unit FCadImpostos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, wwdbedit, wwdblook,
  TB97Ctls, TB97Tlbr, ComCtrls, CMTree, IvDictio, IvMulti, IvEMulti,
  CMProcuraMask, CmEventosCadastro, ImgList;

type
  TfrmCadImpostos = class(TfrmCadastroCS)
    Label1: TLabel;
    DBNomeImposto: TwwDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label4: TLabel;
    DBLookupComboSubConta: TwwDBLookupCombo;
    qryContaContabil: TwwQuery;
    qryContaContabilPLACONTA: TStringField;
    qryContaContabilPLATIPO: TStringField;
    qryContaContabilPLANOME: TStringField;
    qryContaContabilPLACCUST: TStringField;
    gbIntContab: TGroupBox;
    lblContaContabil: TLabel;
    DBRadioGroup3: TDBRadioGroup;
    MontaSelectConta: TMontaSelect;
    btnBuscaContaDebCre1: TBitBtn;
    qryVerificaConta: TwwQuery;
    qrySubConta: TwwQuery;
    Label2: TLabel;
    btnBuscaContaDebCre2: TBitBtn;
    dbedtContaCredito: TwwDBEdit;
    dbedtContaDebito: TwwDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    lblContaDebito: TLabel;
    qryIDIMPOSTO: TFloatField;
    qryNOMEIMPOSTO: TStringField;
    qryCODSUBCONTA: TFloatField;
    qryTRATAMENTO: TStringField;
    qryIDPESSOA: TFloatField;
    qryCONTACREDITO: TStringField;
    qryPERCVALOR: TStringField;
    qryITEMNOTA: TStringField;
    qryPLANO: TFloatField;
    qryCONTADEBITO: TStringField;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lblContaCredito: TLabel;
    procedure qryAfterInsert(DataSet: TDataSet);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure btnBuscaContaDebCre1Click(Sender: TObject);
    procedure dbedtContaDebitoExit(Sender: TObject);
    procedure dbedtContaCreditoExit(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    idImposto     : integer;
  public
    { Public declarations }
  end;

var
  frmCadImpostos: TfrmCadImpostos;
  bObrigaSubConta : boolean;
implementation

uses uMensErro, uDataBase, UModulo, DBaseDados, UAutorizacao,
               uSistema, uIntegraBack,uFuncaoGeral;

{$R *.DFM}

procedure TfrmCadImpostos.CmeCadastroConfirma(Sender: TObject);
begin
   ds.DataSet.CheckBrowseMode;
   dtmBaseDados.dbBaseDados.ApplyUpdates([qry]);
end;

procedure TfrmCadImpostos.qryAfterInsert(DataSet: TDataSet);
begin
  inherited;
  { Incluindo o próximo código do imposto.     }
     qry.FieldByName('IDIMPOSTO').AsInteger := LeUltRegistro(nil, 'IMPOSTOSCONTRATO');

  { Pegando o código da empresa. }
     qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;

  { Default = Digitar somente percentual. }
  qry.FieldByName('PERCVALOR').AsString := 'P';

  { Default = Inside sobre a nota. }
  qry.FieldByName('ITEMNOTA').AsString := 'N';

  { Default = Acrescenta no valor do contrato. }
  qry.FieldByName('TRATAMENTO').AsInteger := 1;

     { Posicionando sobre o Campo "Nome do Imposto". }
  DBNomeImposto.SetFocus;
end;

procedure TfrmCadImpostos.FormActivate(Sender: TObject);
begin
   inherited;
   { Abrindo a Tabela de Contratos. }
   idImposto := 0;
   qry.Close;
   qry.SQL.Clear;
   qryCONTADEBITO.EditMask := trim(IntegraBack.MascaraPlano) + ';0;_';
   qryCONTACREDITO.EditMask := trim(IntegraBack.MascaraPlano) + ';0;_';
   qry.SQL.Text := 'SELECT * FROM IMPOSTOSCONTRATO WHERE IMPOSTOSCONTRATO.IDIMPOSTO = '+IntToStr(IdImposto);
   qry.Open;
   qrySubConta.Close;
   qrySubConta.Open;
end;

procedure TfrmCadImpostos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
     qry.Close;
     qrySubConta.Close;
end;

procedure TfrmCadImpostos.CmeCadastroFind(Sender: TObject);
begin
   if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then begin
      { Realizando a Busca. }
      qry.Close;
      qry.SQL.Clear;
      qry.SQL.Text := 'SELECT * FROM IMPOSTOSCONTRATO WHERE IMPOSTOSCONTRATO.IDIMPOSTO = '+MontaSelect.ValoresChave[0];
      qry.Open;
      idImposto := qry.FieldByName('IDIMPOSTO').AsInteger;

      qryVerificaConta.Close;
      qryVerificaConta.Params[0].asInteger  := IntegraBack.Plano;
      qryVerificaConta.Params[1].asString   := qry.fieldbyname('CONTADEBITO').Asstring;
      qryVerificaConta.Open;

      lblContaDebito.caption := qryVerificaConta.FieldByName('PLANOME').AsString;

      qryVerificaConta.Close;
      qryVerificaConta.Params[0].asInteger  := IntegraBack.Plano;
      qryVerificaConta.Params[1].asString   := qry.fieldbyname('CONTACREDITO').Asstring;
      qryVerificaConta.Open;

      lblContaCredito.caption := qryVerificaConta.FieldByName('PLANOME').AsString;
      qrySubConta.Close;
      qrySubConta.ParamByName('EMPRESAPROP').AsInteger := sistema.idempresa;
      qrySubConta.open;
   end;
end;

procedure TfrmCadImpostos.btnBuscaContaDebCre1Click(Sender: TObject);
begin
  inherited;
   if Modulo.bIntegraContab then begin
      MontaSelectConta.Mascaras[0] := trim(IntegraBack.MascaraPlano) + ';0; ';
      MontaSelectConta.Filtro.Add('PLANOCONTA.PLANO = ' + IntToStr(IntegraBack.Plano));
   end;
      MontaSelectConta.Executar;
      Repaint;
   if MontaSelectConta.RetornouValor then begin
      qrySubConta.Close;
      qrySubConta.ParamByName('EMPRESAPROP').AsInteger := sistema.idempresa;
      qrySubConta.Open;
      qryVerificaConta.Close;
      qryVerificaConta.Params[0].asInteger  := IntegraBack.Plano;
      qryVerificaConta.Params[1].asString   := MontaSelectConta.ValoresChave[0];
      qryVerificaConta.Open;
      bObrigaSubConta := qryVerificaConta.FieldByName('PLASUBCONTA').asString = 'S';
      // se não há registros, a Conta não existe
      if qryVerificaConta.isEmpty then begin
         MsgDlg('Essa Conta Contábil não é válida!','Atenção',mtWarning,[mbOk],0);
      end else begin
          if sender = btnBuscaContaDebCre2 then begin
             qry.FieldByName('CONTACREDITO').AsString := MontaSelectConta.ValoresChave[0];
             lblContaCredito.caption := MontaSelectConta.ValoresChave[1];
          end;
          if sender = btnBuscaContaDebCre1 then begin
             qry.FieldByName('CONTADEBITO').AsString := MontaSelectConta.ValoresChave[0];
             lblContaDebito.caption := MontaSelectConta.ValoresChave[1];
          end;
      end;
      if BObrigaSubConta then DBLookupComboSubConta.enabled:=true
      else DBLookupComboSubConta.enabled:=false;
   end;
end;

procedure TfrmCadImpostos.dbedtContaDebitoExit(Sender: TObject);
begin
  inherited;
  if trim(dbedtContaCredito.Text)= '' then lblContaCredito.Caption := '';
end;

procedure TfrmCadImpostos.dbedtContaCreditoExit(Sender: TObject);
begin
  inherited;
  if trim(dbedtContaDebito.Text)= '' then lblContaDebito.Caption := '';

end;

procedure TfrmCadImpostos.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  lblContaDebito.caption:= '';
  lblContaCredito.caption := '';
end;

procedure TfrmCadImpostos.bbtnConfirmarClick(Sender: TObject);
begin
   if trim(qry.FieldByName('NOMEIMPOSTO').AsString) = '' then begin
       MsgDlg('Obrigatório preencher o nome do Imposto','Atenção',mtWarning,[mbOk],0);
       DBNomeImposto.SetFocus;
       exit;
   end;
  inherited;
end;

procedure TfrmCadImpostos.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  lblContaDebito.caption:= '';
  lblContaCredito.caption := '';
end;

procedure TfrmCadImpostos.bbtnCancelarClick(Sender: TObject);
begin
  inherited;

    if qry.active then begin
      qryVerificaConta.Close;
      qryVerificaConta.Params[0].asInteger  := IntegraBack.Plano;
      qryVerificaConta.Params[1].asString   := qry.fieldbyname('CONTADEBITO').Asstring;
      qryVerificaConta.Open;

      lblContaDebito.caption := qryVerificaConta.FieldByName('PLANOME').AsString;

      qryVerificaConta.Close;
      qryVerificaConta.Params[0].asInteger  := IntegraBack.Plano;
      qryVerificaConta.Params[1].asString   := qry.fieldbyname('CONTACREDITO').Asstring;
      qryVerificaConta.Open;

      lblContaCredito.caption := qryVerificaConta.FieldByName('PLANOME').AsString;
      qrySubConta.Close;
      qrySubConta.ParamByName('EMPRESAPROP').AsInteger := sistema.idempresa;
      qrySubConta.open;

      end;
end;

end.
