unit FConfigBloqMT;
{-------------------------------------------------------------------------------
Analista : Alex Pereira
Data     : 15/04/04
Pendência: 14671
Descrição: Trocar a CMIntBanco50 para CMIntBancoMT50. Com auxílio do Tavares
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, uModulo,
  Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, Mask, wwdbedit, Grids, Wwdbigrd, Wwdbgrid,
  CmEventosCadastro, ImgList, FCadastroMT, DBClient, uCMClientDataSet,
  uCtrlTemplbloqcheque, uCtrlConfigbloquete, {$IFDEF VER0505} uComum {$ELSE} uCMTypes{$ENDIF};

type
  TFrmConfigBloqMT = class(TfrmCadastroMT)
    Panel1: TPanel;
    LbldocEscluidos: TPanel;
    wwDBGrid1: TwwDBGrid;
    dsDet: TwwDataSource;
    Label4: TLabel;
    dbedlayoutbloq: TwwDBEdit;
    BtnTestaImpressao: TToolbarButton97;
    CkbFonteReduzida: TDBCheckBox;
    CdsDet: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure CdsDetBeforeDelete(DataSet: TDataSet);
    procedure CdsDetPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CdsDetDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure CdsDetNewRecord(DataSet: TDataSet);
    procedure BtnTestaImpressaoClick(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    bInclui: Boolean;
    CtrlTemplbloqcheque : TCtrlTemplbloqcheque;
    CtrlConfigbloquete  : TCtrlConfigbloquete;
  public
    { Public declarations }
  end;

var
  FrmConfigBloqMT: TFrmConfigBloqMT;

implementation

Uses uCheqBloqMT, uMensErro, DBaseDados, uSistema;

{$R *.DFM}

procedure TFrmConfigBloqMT.CmeCadastroInsert(Sender: TObject);
Var
   x:Integer;
Begin
 CdsDet.data := CtrlConfigbloquete.ListConfigbloquete(-1);
   Inherited;
   bInclui := True;
   For X:=0 To 24 Do
   Begin
     CdsDet.Append;

     CdsDet.FieldByName('CodBloqChe').AsFloat := Cds.FieldByName('CodBloqChe').AsFloat;
     CdsDet.FieldByName('CAMPOBLOQUETO').AsInteger := X;
     Case Round(CdsDet.fieldbyname('CAMPOBLOQUETO').asinteger) Of
         0: CdsDet.fieldbyname('DESCCAMPO').Value := 'Local Pgto';
         1: CdsDet.fieldbyname('DESCCAMPO').Value := 'Vencimento';
         2: CdsDet.fieldbyname('DESCCAMPO').Value := 'Data Doc';
         3: CdsDet.fieldbyname('DESCCAMPO').Value := 'Número Doc';
         4: CdsDet.fieldbyname('DESCCAMPO').Value := 'Espécie Doc';
         5: CdsDet.fieldbyname('DESCCAMPO').Value := 'Aceite';
         6: CdsDet.fieldbyname('DESCCAMPO').Value := 'Data Process';
         7: CdsDet.fieldbyname('DESCCAMPO').Value := 'Nosso Número';
         8: CdsDet.fieldbyname('DESCCAMPO').Value := 'Carteira';
         9: CdsDet.fieldbyname('DESCCAMPO').Value := 'Espécie';
         10: CdsDet.fieldbyname('DESCCAMPO').Value := 'Quantidade';
         11: CdsDet.fieldbyname('DESCCAMPO').Value := 'Valor Outra Moeda';
         12: CdsDet.fieldbyname('DESCCAMPO').Value := 'Valor Nominal';
         13: CdsDet.fieldbyname('DESCCAMPO').Value := 'Pagáve Até';
         14: CdsDet.fieldbyname('DESCCAMPO').Value := 'Desconto Até';
         15: CdsDet.fieldbyname('DESCCAMPO').Value := 'Mensagem 1';
         16: CdsDet.fieldbyname('DESCCAMPO').Value := 'Mensagem 2';
         17: CdsDet.fieldbyname('DESCCAMPO').Value := 'Mensagem 3';
         18: CdsDet.fieldbyname('DESCCAMPO').Value := 'Mensagem 4';
         19: CdsDet.fieldbyname('DESCCAMPO').Value := 'Mensagem 5';
         20: CdsDet.fieldbyname('DESCCAMPO').Value := 'Nome Do Sacado';
         21: CdsDet.fieldbyname('DESCCAMPO').Value := 'Endereço do Sacado';
         22: CdsDet.fieldbyname('DESCCAMPO').Value := 'Logradouro';
         23: CdsDet.fieldbyname('DESCCAMPO').Value := 'Bairro, Cidade, Estado e Cep';
         24: CdsDet.fieldbyname('DESCCAMPO').Value := 'Margem Inferior';
     end;
     CdsDet.Post;
   end;
   dbedlayoutbloq.SetFocus;
   CdsDet.First;
   bInclui := False;
end;

procedure TFrmConfigBloqMT.CmeCadastroCancel(Sender: TObject);
Begin
   Inherited;
   If Not Cds.IsEmpty Then
      CdsDet.data := CtrlConfigbloquete.ListConfigbloquete(Cds.FieldByName('CodBloqChe').AsFloat);
End;

procedure TFrmConfigBloqMT.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;                        
   If MontaSelect.RetornouValor Then
   Begin
      Cds.data := CtrlTemplbloqcheque.ListTemplbloqcheque(StrToInt(MontaSelect.ValoresChave[0]));
      CdsDet.data := CtrlConfigbloquete.ListConfigbloquete(Cds.FieldByName('CodBloqChe').AsFloat);
   End;
End;

procedure TFrmConfigBloqMT.CmeCadastroDelete(Sender: TObject);
Begin
  CdsDet.First;
  While Not CdsDet.Eof Do
        CdsDet.Delete;
  Inherited;
End;

procedure TFrmConfigBloqMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTemplbloqcheque := TCtrlTemplbloqcheque.Create;
  CtrlTemplbloqcheque.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlTemplbloqcheque.Cds := Cds;
  CtrlTemplbloqcheque.cdsConfigbloquete := CdsDet;
  Cds.data := CtrlTemplbloqcheque.ListTemplbloqcheque(-1);

  CtrlConfigbloquete := TCtrlConfigbloquete.Create;
  CtrlConfigbloquete.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

  CdsDet.data := CtrlConfigbloquete.ListConfigbloquete(-1);

  bInclui := False;
end;

procedure TFrmConfigBloqMT.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  if (Field.FieldName='COLUNABLOQUETO') Or (Field.FieldName='LINHABLOQUETO') then
  begin
    AFont.Color:=clNavy;
    ABrush.Color:=$0080FFFF;{Amarelo claro}
  end;
end;

procedure TFrmConfigBloqMT.CdsDetBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  If CmeCadastro.Operacao In [OpInserir,Opalterar] Then
     Raise EDatabaseError.Create('Os Registros de Configuração Não Podem Ser Excluídos');
end;

procedure TFrmConfigBloqMT.CdsDetPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  Action := daFail;
end;

procedure TFrmConfigBloqMT.CdsDetDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  inherited;
  Action := daFail;
end;

procedure TFrmConfigBloqMT.CdsDetNewRecord(DataSet: TDataSet);
begin
  inherited;
  If Not bInclui Then
     Raise EDatabaseError.Create('Os Registros de Configuração São Inclusos Automaticamente');
end;

procedure TFrmConfigBloqMT.BtnTestaImpressaoClick(Sender: TObject);
Var
  CheqBloqCM: TCheqBloqCM;
  X: Integer;
begin
  inherited;
  If Not Cds.IsEmpty  Then
  Begin
      Screen.Cursor := CrHourGlass;
      CheqBloqCM := TCheqBloqCM.Create(Modulo.ImpressoraDefault,Modulo.ModeloImpressora);
      Try
        If CheqBloqCM.InicializaImpressora('Emissão de Bloquetos Para Cobrança') Then
        Begin
           CheqBloqCM.FonteCondensada := (Cds.fieldbyname('FLGIMPCONDENSADO').AsString = 'S');

           For X:=0 To 5 Do
           Begin
                If Not CheqBloqCM.GeraCobr(
                Cds.FieldByName('CodBloqChe').AsInteger,
                'Rio de Janeiro',
                DateToStr(Date + 30),
                DateToStr(Date),
                '9999999-' + IntToStr(X),
                'DUPL', 'S', DateToStr(date), '99999999', '16',
                'R$',
                FloatToStrf(999999999,ffnumber,13,2),
                '999999999.99',
                FloatToStrF(999999999,ffNumber,13,2),
                DateToStr(Date + 30),
                DateToStr(Date + 35),
                FloatToStrF(999999999,ffNumber,13,2),
                'Mensagem 1',
                'Mensagem 2',
                'Mensagem 3',
                'Mensagem 4',
                'Mensagem 5',
                'Cm Soluções Informática',
                '99.999.999/9999-99',
                'Rua Campos Sales',
                '55',
                'Prédio',
                'Tijuca',
                'Rio de Janeiro',
                'RJ',
                '99999-999') Then  abort;
           End;
           CheqBloqCM.Imprime;
           MsgDlg('Término da Impressão','Contas a Receber',mtInformation,[mbOK],0);
        End;
        CheqBloqCM.Free;
        Screen.Cursor := CrDefault;
      Except
        CheqBloqCM.Free;
        Screen.Cursor := CrDefault;
        MsgDlg('Não foi possível imprimir o Bloqueto','Erro',mtInformation,[mbOK],0);
        Raise;
      End;
  End;
  BtnTestaImpressao.Down := False;
End;


Procedure TFrmConfigBloqMT.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  BtnTestaImpressao.Enabled := Not bbtnConfirmar.Enabled;
End;

procedure TFrmConfigBloqMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := CtrlTemplbloqcheque.ExcluirTemplbloqcheque;
end;

procedure TFrmConfigBloqMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := CtrlTemplbloqcheque.GravarTemplbloqcheque;
end;

procedure TFrmConfigBloqMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := CtrlTemplbloqcheque.GravarTemplbloqcheque;
end;

procedure TFrmConfigBloqMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlTemplbloqcheque.MessageInfo <> '' Then
     MsgDlg(CtrlTemplbloqcheque.MessageInfo,'Erro',mtError,[mbOK],0);
end;

end.

