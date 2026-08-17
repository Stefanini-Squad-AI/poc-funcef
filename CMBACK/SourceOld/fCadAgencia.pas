{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Cadastro de Agências Bancário                       }
{   Subtipo pessoa AGENCIABANCARIA                      }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 05/01/2001                             }
{                                                       }
{*******************************************************}
unit fCadAgencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fPessoa, Menus, MontaSelect, DBTables, Db, CMwwQuery, Wwdatsrc,
  Pessoa, TB97, MAHlpBtn, StdCtrls, Buttons, checklst, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, wwdblook, DBCtrls, Mask,
  wwdbedit, ExtDlgs, TB97Ctls, TB97Tlbr, uIntegraBack,
  IvDictio, IvMulti, IvEMulti, CMDBLookupCombo, Wwdbspin,
  CmEventosCadastro, ImgList, wwdbdatetimepicker, CMDateTimePicker,
  ExtCtrls, Wwquery, TREdit;

type
  TfrmCadAgencia = class(TfrmPessoa)
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Label14: TLabel;
    dblkBanco: TwwDBLookupCombo;
    qryContab: TwwQuery;
    dsContab: TwwDataSource;
    qryContabPLANO: TFloatField;
    qryContabPLACONTA: TStringField;
    qryContabPLATIPO: TStringField;
    qryContabPLANOME: TStringField;
    QryBanco: TwwQuery;
    dbedNumAgencia: TwwDBEdit;
    Label13: TLabel;
    qrySubTipoIDPESSOA: TFloatField;
    qrySubTipoIDBANCO: TFloatField;
    qrySubTipoNUMAGENCIA: TStringField;
    QryBancoIDPESSOA: TFloatField;
    QryBancoNUMBANCO: TStringField;
    QryBancoNOME: TStringField;
    QryBancoMASCARAAGENCIA: TStringField;
    QryBancoFLGVALIDACC: TStringField;
    QryBuscaAgencia: TwwQuery;
    QryBuscaAgenciaIDPESSOA: TFloatField;
    qrySubTipoFLGATIVO: TStringField;
    CkbAtivo: TDBCheckBox;
    Bevel2: TBevel;
    RgTipo: TDBRadioGroup;
    qrySubTipoFLGTIPO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure dblkBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);

    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
  private
    sMascaraNumAgencia :String;
    procedure SetMascaraNumAgencia;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmCadAgencia: TfrmCadAgencia;
  spdChave      : String;
  lProblema     : Boolean;
  iPlano        : Integer;

implementation

{$R *.DFM}

Uses UAutorizacao,UMensErro, DBaseDados, USistema, dCmBack;

procedure TfrmCadAgencia.FormCreate(Sender: TObject);
Var
  sMascara  : String;
  qryTemp   : TwwQuery;
begin
  inherited;
  If DtmCmBack.QryParGlobal.Active Then DtmCmBack.QryParamGlobal.Close;
  DtmCmBack.QryParGlobal.ParamByname('IDPESSOA').AsFloat := Sistema.IdEmpresa;
  DtmCmBack.QryParGlobal.Open;

  If Not DtmCmBack.QryParGlobalMASCARANUMAGENCIA.IsNull Then
     sMascaraNumAgencia := DtmCmBack.QryParGlobalMASCARANUMAGENCIA.AsString + ';' + MaskNoSave + '; '
  Else
     sMascaraNumAgencia := '';

  DtmCmBack.QryParGlobal.Close;


  qryTemp := TwwQuery.Create( Application );
  qryTemp.DataBaseName := 'BaseDados';
  lProblema := false;
  if IntegraBack.Contabilidade = 'S' then Begin
    qryTemp.Close;
    qryTemp.Sql.Clear;
    qryTemp.Sql.text := 'SELECT PLANO FROM PARAMCONTAB WHERE IDPESSOA = ' + InttoStr(Sistema.IdEmpresa);
    Try
      qryTemp.open;
      if not qryTemp.Eof Then Begin
         iPlano := qryTemp.FieldByName('PLANO').AsInteger;
         qryTemp.Close;
         qryTemp.Sql.Clear;
         qryTemp.Sql.text := 'SELECT MASCARA FROM PLANO WHERE PLANO = ' + InttoStr(iPlano);
         Try
           qryTemp.open;
           if not qryTemp.Eof Then Begin
             sMascara := qryTemp.Fieldbyname('MASCARA').asString;
             qryContab.Close;
             qryContab.Sql.Clear;
             qryContab.Sql.text := 'SELECT PLANO,PLACONTA,PLATIPO,PLANOME FROM PLANOCONTA WHERE PLANO = ' + IntToStr(iPlano);
           end
           else Begin
             MsgDlg('Planos não cadastrados para esta empresa',LerMensagem(2),mtError,[mbOk],0);
             lProblema := true;
           end;
         Except
           MsgDlg('Problemas na abertura da tabela PLANO',LerMensagem(2),mtError,[mbOk],0);
           lProblema := true;
         end;
      end
      else Begin
        MsgDlg('Parâmetros Contábeis não cadastrados para esta empresa',LerMensagem(2),mtError,[mbOk],0);
        lProblema := true;
      end;
    Except
       MsgDlg('Problemas na abertura da tabela PARAMCONTAB',LerMensagem(2),mtError,[mbOk],0);
       lProblema := true;
    end;
  end;
  qryTemp.Close;
  qryTemp.Free;
end;

procedure TfrmCadAgencia.dblkBancoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  SetMascaraNumAgencia;
end;

Procedure TfrmCadAgencia.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
  Accept := Not qrySubTipoNUMAGENCIA.IsNull;

  If Not Accept Then
     MsgDlg('Nº da Agência não informada','Atenção',mtError,[mbOk],0)
  Else
  Begin
     Accept := Trim(dblkBanco.Text) <> '';

     If Not Accept Then
        MsgDlg('Nº do Banco não informado','Atenção',mtError,[mbOk],0)
     Else
     Begin
        With QryBuscaAgencia Do
        Begin
           If Active Then Close;
           If Not Prepared Then Prepare;
           Params[0].ASString := qrySubTipoNUMAGENCIA.AsString;
           Params[1].AsFloat := qrySubTipoIDBANCO.AsFloat;
           Open;
           Accept := (IsEmpty) Or
                     (QryBuscaAgenciaIDPESSOA.AsFloat = qrySubTipoIDPESSOA.AsFloat);
           Close;

           If Not Accept Then
              MsgDlg('Nº da Agência já cadastrada','Atenção',mtError,[mbOk],0);
        End;
     End;
  End;
End;

procedure TfrmCadAgencia.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then SetMascaraNumAgencia;
end;

procedure TfrmCadAgencia.SetMascaraNumAgencia;
Begin
  If (Not qryBanco.IsEmpty) Then
  Begin
     QryBanco.Locate('IDPESSOA',qrySubTipoIDBANCO.AsInteger,[]);

     If (Not qryBancoMASCARAAGENCIA.IsNull) Then
        qrySubTipoNUMAGENCIA.EditMask := qryBancoMASCARAAGENCIA.AsString + ';' + MaskNoSave + '; '
     Else
        qrySubTipoNUMAGENCIA.EditMask := sMascaraNumAgencia;
  End;

End;

end.
