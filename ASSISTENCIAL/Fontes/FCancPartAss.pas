unit FCancPartAss;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Gleyber
// Data        : 05/12/2006
// Pendencia   : 23922
// Rotina      : UPDDET
// Alteração   : Retirar referência ao campo IDSITPLANOASS.
//------------------------------------------------------------------------------


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, Db, wwdblook, CMDBLookupCombo, StdCtrls, wwdbdatetimepicker,
  CMDateTimePicker, DBTables, Wwquery, CmEventosCadastro, ImgList,
  MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls;

type
  TFrmCancPartAss = class(TfrmCadastroCS)
    pnlTitular: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    grpDadosBenef: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    qrySituacao: TwwQuery;
    qrySituacaoIDSITPLANOASS: TFloatField;
    qrySituacaoDESCRICAO: TStringField;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    dtpDataCancel: TwwDBDateTimePicker;
    qryBenefAss: TwwQuery;
    dsBenefAss: TwwDataSource;
    updBenefAss: TUpdateSQL;
    dbmObservacao: TDBMemo;
    qryContAss: TwwQuery;
    dsContAss: TwwDataSource;
    updContAss: TUpdateSQL;
    qryAux: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    lkbNovaSituacao: TwwDBLookupCombo;
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCancPartAss: TFrmCancPartAss;

implementation

uses uMensErro, UDataBase;

{$R *.DFM}

procedure TFrmCancPartAss.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor
   Then Begin
     qrySituacao.Close;
     qrySituacao.Open;

     qry.Close;
     qry.ParamByName('IDPESSOA').AsInteger    := StrToInt(MontaSelect.ValoresChave[0]);
     qry.ParamByName('IDPESSJUR').AsInteger   := StrToInt(MontaSelect.ValoresChave[1]);
     qry.ParamByName('SEQPROPOSTA').AsInteger := StrToInt(MontaSelect.ValoresChave[2]);
     qry.ParamByName('IDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[3]);
     qry.ParamByName('IDPLANASS').AsInteger   := StrToInt(MontaSelect.ValoresChave[4]);
     qry.Open;

     qryBenefAss.Close;
     qryBenefAss.ParamByName('IDTITULAR').AsInteger   := StrToInt(MontaSelect.ValoresChave[0]);
     qryBenefAss.ParamByName('IDPESSJUR').AsInteger   := StrToInt(MontaSelect.ValoresChave[1]);
     qryBenefAss.ParamByName('SEQPROPOSTA').AsInteger := StrToInt(MontaSelect.ValoresChave[2]);
     qryBenefAss.ParamByName('IDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[3]);
     qryBenefAss.ParamByName('IDPLANASS').AsInteger   := StrToInt(MontaSelect.ValoresChave[4]);
     qryBenefAss.Open;

     qryContAss.Close;
     qryContAss.ParamByName('IDTITULAR').AsInteger   := StrToInt(MontaSelect.ValoresChave[0]);
     qryContAss.ParamByName('IDPESSJUR').AsInteger   := StrToInt(MontaSelect.ValoresChave[1]);
     qryContAss.ParamByName('SEQPROPOSTA').AsInteger := StrToInt(MontaSelect.ValoresChave[2]);
     qryContAss.ParamByName('IDPLANOPREV').AsInteger := StrToInt(MontaSelect.ValoresChave[3]);
     qryContAss.ParamByName('IDPLANASS').AsInteger   := StrToInt(MontaSelect.ValoresChave[4]);
     qryContAss.Open;

     lkbNovaSituacao.Text := '';
   End;
end;

procedure TFrmCancPartAss.bbtnConfirmarClick(Sender: TObject);
begin
  // Crítica dos campos
  If Trim(dtpDataCancel.Text) = ''
   Then Begin
    MsgDlg('É necessário preencher a DATA DO CANCELAMENTO antes de confirmar o cancelamento.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    dtpDataCancel.SetFocus;
    Exit;
   End;

  If Trim(lkbNovaSituacao.Text) = ''
   Then Begin
    MsgDlg('É necessário preencher a NOVA SITUAÇÃO do participante antes de confirmar o cancelamento.','ATENÇÃO',mtError,[mbOk,mbHelp],0);
    lkbNovaSituacao.SetFocus;
    Exit;
   End;

   // Gravação da BenefAss e ContAss antes da PartAss
   qryBenefAss.First;
   While Not qryBenefAss.Eof do
    Begin
      qryBenefAss.Edit;
      qryBenefAss.FieldByName('FLGATIVO').AsInteger        := 0;
      qryBenefAss.FieldByName('DTCANCELAMENTO').AsDateTime := dtpDataCancel.Date;
      qryBenefAss.FieldByName('OBSCANCEL').AsString        := dbmObservacao.Text;
      qryBenefAss.Post;

      qryBenefAss.Next;
    End;

   qryContAss.First;
   While Not qryContAss.Eof do
    Begin
      qryContAss.Edit;
      qryContAss.FieldByName('FLGATIVO').AsInteger        := 0;
      qryContAss.Post;

      qryContAss.Next;
    End;
  Try
    AplicaAlteracoes([qryBenefAss, qryContAss]);
    inherited;
    MsgDlg('Cancelamento do participante efetuado com sucesso.','ATENÇÃO',mtInformation,[mbOk],0);
  Except
    MsgDlg('Erro no Cancelamento do participante!! Verifique!!','ATENÇÃO',mtError,[mbOk],0);
  End;
end;

procedure TFrmCancPartAss.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  lkbNovaSituacao.Text := '';
end;

procedure TFrmCancPartAss.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  lkbNovaSituacao.Text := '';
end;

end.
