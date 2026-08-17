//***************************************************************************************
//Nº SOL:            139008
//Nº KINTANA         851077
//Data da Alteração: 01/07/2010
//Responsável:       Marcos Luiz de Jesus
//Descrição:         Fazer aparecer o campo CODIGOSPC na Tela e grava-lo.
//**************************************************************************************

//***************************************************************************************
//Rotina:            CmeCadastroInsert
//Nº SOL:            126865
//Nº KINTANA         667421
//Data da Alteração: 02/02/2010
//Responsável:       Ricardo A.
//Descrição:         Criação do campo FLGEXCLUSIVOCONTAB.
//**************************************************************************************

//------------------------------------------------------------------------------
//
// Autor......: Arnaldo V. Scarin
// Data.......: 09/11/2009
// Sol........: 126170
// Kintana....: 657025
// Descrição..: Inclusão de Campo para USO PGA no cadastro de Plano Previdenciario
//              Contabil
//
//--------------------------------------------------------------------------------
//========================================================================
//
//   Pendência : 18537
//   Descrição : Criação do campo IDPLANOPREVPREV
//
//========================================================================
//  pendência 16751 - 10/05/2004 - criação do campo CODSPC
unit FCadPlanPrevContabilMT;

interface

uses
  Windows, Messages, SysUtils, uVerificaPreenchimento, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet, wwdbedit,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  uCtrlPlanPrevContabil
{$IFNDEF VERSAO0505}
  , uCmTypes, wwdblook, DBCtrls
{$ENDIF}
;

type
  TFrmCadPlanPrevContabil = class(TFrmCadastroMT)
    dbedPlanPrevContabil: TwwDBEdit;
    Label1: TLabel;
    cdsPlanPrevPrev: TCMClientDataSet;
    Label2: TLabel;
    dbckAtivo: TDBCheckBox;
    Label3: TLabel;
    cdsCodSPC: TCMClientDataSet;
    cboPlanoPrevPrev: TwwDBLookupCombo;
    lbCodSPC: TLabel;
    edtCodSPC: TDBEdit;
    DBckIdentificado: TDBCheckBox;
    Label4: TLabel;
    dbckUsoPGA: TDBCheckBox;
    chkUsoExclusivoContab: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure cboPlanoPrevPrevChange(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    { Private declarations }
    PlanPrevContabil: TCtrlPlanPrevContabil;
    Procedure Seleciona( IdPlanPrevContabil: Double = 0 );

    //  P: 18537 - 03/02/2005
    procedure MenssagemErro(sMsgErro: string);

  public
    { Public declarations }
  end;

var
  FrmCadPlanPrevContabil: TFrmCadPlanPrevContabil;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TFrmCadPlanPrevContabil.Seleciona( IdPlanPrevContabil: Double );
begin
  Cds.Data := PlanPrevContabil.ListaPlanPrevContabil( IdPlanPrevContabil );
end;



procedure TFrmCadPlanPrevContabil.FormCreate(Sender: TObject);
begin
  inherited;
  PlanPrevContabil := TCtrlPlanPrevContabil.Create;
  PlanPrevContabil.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               MenssagemErro);
  PlanPrevContabil.cds := cds;
  Seleciona( -1 );

  // início - pendência 16751
  cdsPlanPrevPrev.data := PlanPrevContabil.ListaCodSpcPlanoPrevAdmPrev;
  cdsPlanPrevPrev.First;
  // início - pendência 16751
end;



procedure TFrmCadPlanPrevContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PlanPrevContabil.Free;
end;



procedure TFrmCadPlanPrevContabil.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
end;



procedure TFrmCadPlanPrevContabil.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := PlanPrevContabil.Gravar;
end;



procedure TFrmCadPlanPrevContabil.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := PlanPrevContabil.Gravar;
end;



procedure TFrmCadPlanPrevContabil.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := PlanPrevContabil.Gravar;
end;



procedure TFrmCadPlanPrevContabil.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedPlanPrevContabil.SetFocus;
end;



procedure TFrmCadPlanPrevContabil.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.FieldByName('ATIVO').AsString := 'S';

  // Ricardo A. SOL 126865 KTN 667421
  Cds.FieldByName( 'FLGEXCLUSIVOCONTAB' ).AsString := 'N';
  // FIM Ricardo A. SOL 126865 KTN 667421

  dbedPlanPrevContabil.SetFocus;
end;



procedure TFrmCadPlanPrevContabil.cboPlanoPrevPrevChange(Sender: TObject);
begin
  inherited;
  //  P: 18537 - 03/02/2005
  if cboPlanoPrevPrev.Text <> '' then
  begin
     edtCodSPC.Enabled := False;
     // Marcos Luiz de Jesus Nº SOL:  139008  Nº KINTANA  851077
     cds.Edit;
     cds.FieldbyName('CODSPC').asString :=  cdsPlanPrevPrev.FieldByName('CODIGOSPC').AsString;
     cds.Post;
     lbCodSPC.Caption  := cdsPlanPrevPrev.FieldByName('CODIGOSPC').AsString;
  end
  else
  begin
     edtCodSPC.Enabled := True;
     lbCodSPC.Caption  := '';
  end;

end;



procedure TFrmCadPlanPrevContabil.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
var oQry : TCMClientDataSet;
begin
  inherited;
  try
     Accept := False;

     if Trim(dbedPlanPrevContabil.Text) = '' then
        raise EValidacao.createVal('O campo NOME não pode estar nulo!',dbedPlanPrevContabil)
     else if cboPlanoPrevPrev.Text = '' then
     begin
       if edtCodSPC.Text = '' then
          raise EValidacao.createVal('O campo CÓDIGO SPC não pode estar nulo!',edtCodSPC)
       else
       begin
          Cds.FieldByName('IDPLANOPREVPREV').AsString := '';
          Accept := True;
       end;
     end
     else If dbckUsoPGA.checked then
     begin
       oQry := TCMClientDataSet.Create(Nil);
       try
         oQry.Data := PlanPrevContabil.ExistePlanoPrevContabilPGA;
         Accept := oQry.IsEmpty;
         If Not Accept then
         begin
           If (CmeCadastro.Operacao = opInserir) or
              ((CmeCadastro.Operacao = opAlterar) and
               (oQry.FieldByName('IdPlanoPrev').asInteger <>
                cds.FieldByName('IdPlanoPrev').asInteger)) then
             raise EValidacao.CreateVal('O campo Uso PGA já está preenchido para o Plano'+#13+
                                        oQry.FieldByName('Nome').asString+'!',dbckUsoPGA)
           else
             Accept := True;
         end;
       finally
         FreeAndNil(oQry);
       end;
     end
     else
        Accept := True;

  except
     on ev : EValidacao do
     begin
        if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
        Repaint;
        if ev.Control.CanFocus then ev.Control.SetFocus;
        Exit;
     end;

  end;


end;



procedure TFrmCadPlanPrevContabil.MenssagemErro(sMsgErro: string);
begin
  MsgDlg( sMsgErro, Sistema.NomeAplicativo, mtError, [ mbOK ], 0 );
end;

end.

