// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// Rotina    : dbedNumProcExit
// Autor(a)  : Leo
// Data      : 24/09/2002
// Alteração : valida número do processo
// -----------------------------------------------------------------------------
// Sistema  .: ADMPREV
// Objetivo .: Formulário de Cadastro Beneficiarios do Posto Prisma e
//             associação com seus beneficios
// Form     .: FrmCadBeneficiarioPP - Unit .: FCadBeneficiarioPP
// Data     .: 19/08/2000
// Autor    .: Alexandre Ramos, **--> Serious Developer ...
//------------------------------------------------------------------
// Alterações :

//------------------------------------------------------------------------------

unit FCadBeneficiarioPP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, ExtDlgs, Pessoa, Db, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, Buttons, TB97,
  StdCtrls, DBCtrls, checklst, Grids, Wwdbigrd, Wwdbgrid, wwdblook,
  ComCtrls, ExtCtrls, TabControlDetalhe,
  wwdbedit, Mask, Wwdbspin, CmEventosCadastro, ImgList, CMDBLookupCombo,
  wwdbdatetimepicker, CMDateTimePicker, TREdit;

type
  TFrmCadBeneficiarioPP = class(TfrmPessoa)
    TbOutrosDados: TTabSheet;
    DbLkcEmpresa: TwwDBLookupCombo;
    QryEmpresa: TwwQuery;
    TbBeneficios: TTabSheet;
    QryBeneficio: TwwQuery;
    DsBeneficio: TwwDataSource;
    UpdBeneficio: TUpdateSQL;
    PnlBeneficio: TPanel;
    DbgBeneficios: TwwDBGrid;
    DbLkcBeneficio: TwwDBLookupCombo;
    DbLkcSituacao: TwwDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    QryBuscaBeneficio: TwwQuery;
    QryBuscaSituacao: TwwQuery;
    DBDateEdit3: TCMDateTimePicker;
    DBDateEdit4: TCMDateTimePicker;
    DBDateEdit5: TCMDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    QryBuscaTpPagto: TwwQuery;
    DbLkcPortForma: TwwDBLookupCombo;
    Label9: TLabel;
    QryBuscaPortForma: TwwQuery;
    DbLkcTipoPagto: TwwDBLookupCombo;
    Label10: TLabel;
    QryBeneficioIDBENEFICIARIOPP: TFloatField;
    QryBeneficioIDBENEFICIO: TFloatField;
    QryBeneficioCODPORTFORMA: TFloatField;
    QryBeneficioIDTPPAGTOBENEFIC: TFloatField;
    QryBeneficioIDSITBENEFICIO: TFloatField;
    QryBeneficioDATAINICIO: TDateTimeField;
    QryBeneficioDATAFINALPREVISTA: TDateTimeField;
    QryBeneficioDATAFINAL: TDateTimeField;
    QryBeneficioVALORATUAL: TFloatField;
    QryBeneficioULTMESREAJUSTE: TStringField;
    QryBeneficioULTMESPREPARO: TStringField;
    QryBeneficioULTVALORBRUTO: TFloatField;
    QryBeneficioFLGDATAPREVISTA: TFloatField;
    QryBeneficioNOME: TStringField;
    QryBeneficioDESCBENEF: TStringField;
    QryBeneficioDESCSITBENEFICIO: TStringField;
    Label11: TLabel;
    dbedMatricula: TwwDBEdit;
    dbedValor: TwwDBEdit;
    Label12: TLabel;
    qryMantenedora: TwwQuery;
    dbedNumProc: TwwDBEdit;
    tbsHstBenef: TTabSheet;
    dbgHstBenef: TwwDBGrid;
    dsHstBenef: TwwDataSource;
    qryHstBenef: TwwQuery;
    QryBeneficioNUMPROCINSS: TStringField;
    Label13: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    Procedure PessoaChangeSubtipo(IdPessoa: Integer);
    Procedure PessoaSaveSubtipo(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dbedNumProcExit(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    { Private declarations }


  public
    { Public declarations }
  end;

var
  FrmCadBeneficiarioPP: TFrmCadBeneficiarioPP;

implementation

{$R *.DFM}

Uses uDataBase, uMensErro, dBaseDados, UAdmPrev, Usistema;

procedure TFrmCadBeneficiarioPP.FormShow(Sender: TObject);
begin
  inherited;
// Abre Tabelas Auxiliares
  QryEmpresa.Open;
  QryBeneficio.Open;
  QryBuscaBeneficio.Open;
  QryBuscaSituacao.Open;
  QryBuscaTpPagto.Open;
  QryBuscaPortForma.Open;
  qryMantenedora.Open;
end;

procedure TFrmCadBeneficiarioPP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  Fecha Tabelas Auxiliares
  QryEmpresa.Close;
  QryBeneficio.Close;
  QryBuscaBeneficio.Close;
  QryBuscaSituacao.Close;
  QryBuscaTpPagto.Close;
  QryBuscaPortForma.Close;

  // Se Form de Consulta Geral de Pessoa estiver aberto então retorna a normal.
  WindowState:= wsNormal;
end;

procedure TFrmCadBeneficiarioPP.bbtnOkDetClick(Sender: TObject);
begin
// Caso Inserirndo ou Alterando ....
  If Qrybeneficio.State in [DsInsert, DsEdit] Then Begin
// Testa Campos
    If (Trim(DbEdNumProc.Text) = '')    Or
       (Trim(DbLkcBeneficio.Text) = '') Or
       (Trim(DbEdValor.Text) = '')
    Then Begin
      MsgDlg('Faltam Preencher campos ', 'Erro', MtError, [mbOk],0);
      DbLkcBeneficio.SetFocus;
      Exit;
    End;

// Caso Inserindo um beneficio Gera o IDENTIFICADOR
    If Qrybeneficio.State in [DsInsert] Then Begin
      QryBeneficio.FieldByName('IDBENEFICIARIOPP').AsInteger :=
        Qry.FieldByName('IDPESSOA').AsInteger;
    End;
  End;
  Inherited                                         
end;

procedure TFrmCadBeneficiarioPP.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  If DbLkcBeneficio.CanFocus Then
    DbLkcBeneficio.SetFocus;
end;

procedure TFrmCadBeneficiarioPP.bbtnConfirmarClick(Sender: TObject);
begin
// Testa Campos Obrigatorios
  If (Trim(DbEdMatricula.Text) = '') Then Begin
    MsgDlg('Faltam Preencher campos ', 'Erro', MtError, [mbOk],0);
    PgCtrlDetalhe.ActivePage:=TbOutrosDados;
    DbEdMatricula.SetFocus;
    Exit;
  End;



// Heranca
  inherited;
end;

procedure TFrmCadBeneficiarioPP.bbtnCancelarClick(Sender: TObject);
begin
// Cancela as alteracoes no Beneficio
  QryBeneficio.CancelUpdates;
// Heranca
  inherited;
end;

procedure TFrmCadBeneficiarioPP.PessoaSaveSubtipo(Sender: TObject);
begin
// Heranca
  Inherited;
// Confirma as alteracoes no Beneficio
  dtmBaseDados.dbBaseDados.ApplyUpdates([QryBeneficio]);
End;

Procedure TFrmCadBeneficiarioPP.PessoaChangeSubtipo(IdPessoa: Integer);
Begin
  With Qrybeneficio Do Begin
    If (Active) And (CachedUpdates) then CancelUpdates;
    Close;
    ParamByName('IDPESSOA').value := IdPessoa;
    Open;
  end;
End;


procedure TFrmCadBeneficiarioPP.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
//
end;

procedure TFrmCadBeneficiarioPP.dbedNumProcExit(Sender: TObject);
begin
  inherited;

  if (dbedNumProc.text <> '') then
  begin
     if not ValidaNumProcesso(qrybeneficio.fieldbyname('NUMPROCINSS').AsString) then
     begin
        if MsgDlg('O Número do Processo não foi digitado corretamente. '+
                  'Deseja continuar assim mesmo?', Caption, mtError , [mbNo, mbYes,mbHelp], 0) = mrNo then
        begin
           if dbedNumProc.CanFocus then dbedNumProc.setfocus
        end;
     end;
  end;

end;

procedure TFrmCadBeneficiarioPP.tbcDetalheChange(Sender: TObject);
begin
  inherited;
  // parametriza a query do histórico
  If pgctrlDetalhe.ActivePageIndex = 6 Then
  Begin
    qryHstBenef.Close;
    qryHstBenef.Params[0].Asinteger := QryBeneficio.FieldByname('IDBENEFICIARIOPP').AsInteger;
    qryHstBenef.Params[1].Asinteger := QryBeneficio.FieldByname('IDBENEFICIO').AsInteger;
    qryHstBenef.Open;
    tb97BotoesDetalhe.Visible := False;
  End Else
    tb97BotoesDetalhe.Visible := True;  
end;

procedure TFrmCadBeneficiarioPP.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

end;

end.
