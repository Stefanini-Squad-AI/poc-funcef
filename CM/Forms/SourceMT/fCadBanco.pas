{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 23/02/2002                             }
{                                                       }
{*******************************************************}

unit fCadBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fpessoaMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Tlwn, MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, StdCtrls, CheckLst, ComCtrls, CMDBLookupCombo,
  TREdit, wwdbdatetimepicker, CMDateTimePicker, Wwdbspin, wwdblook, Mask,
  wwdbedit, ExtCtrls, TabControlDetalhe, CMProcura, Menus;

type
  TfrmCadBanco = class(TFrmPessoaMT)
    TbsBanco: TTabSheet;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedNumBanco: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SelSubTipo(rIdPessoa: Double); Override;  
  public
    { Public declarations }
  end;

var
  frmCadBanco: TfrmCadBanco;

implementation

Uses uCtrlPessoa, uCtrlPessoaBanco, uMensErro, uCMTypes, DBaseDados, uSistema;

{$R *.DFM}

procedure TfrmCadBanco.FormCreate(Sender: TObject);
begin
  Pessoa := TCtrlPessoaBanco.Create;
  Pessoa.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                    Sistema.AppRemoteServer,True);
  Pessoa.SubTipo := stBanco;
  Pessoa.TipoPessoa := tpJuridica;
  
  inherited;
end;

procedure TfrmCadBanco.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;



  If Accept Then
  Begin
     Accept := (Trim(dbedNumBanco.Text) <> '');

     If Not Accept Then
        MsgDlg('Nº do Banco não informado','Atenção',mtError,[mbOk],0)
     Else
     Begin
        Accept := TCtrlPessoaBanco(Pessoa).ValidaNumBanco(CdsSubTipo.FieldByName('NUMBANCO').AsFloat, Cds.FieldByName('IDPESSOA').AsFloat);
        If Not Accept Then
           MsgDlg('Nº do Banco já cadastrado','Atenção',mtError,[mbOk],0);
     End;
  End;
end;

procedure TfrmCadBanco.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CdsSubTipo.FieldByName('FLGVALIDACC').AsString := 'S';
end;

procedure TfrmCadBanco.SelSubTipo(rIdPessoa: Double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaBanco(Pessoa).SelBanco(rIdPessoa);
end;

end.
