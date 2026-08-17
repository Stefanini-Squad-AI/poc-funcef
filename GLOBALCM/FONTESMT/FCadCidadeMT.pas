{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
unit FCadCidadeMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, wwdbedit, wwdblook, CMDBLookupCombo, StdCtrls, Mask,
  DBCtrls, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97Ctls, TB97, ExtCtrls, uCtrlCidade, uCtrlEstado, wwQuery
{$IFNDEF VERSAO0505}
  , uCmTypes
{$ENDIF}
;

type
  TFrmCadCidade = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbedNome: TDBEdit;
    dblcEstado: TCMDBLookupCombo;
    DbEdDdd: TwwDBEdit;
    DbEdCodMunMF: TwwDBEdit;
    DbEdNumSeed: TwwDBEdit;
    CdsEstado: TCMClientDataSet;
    EdPais: TEdit;
    DBEdCodigoIbge: TwwDBEdit;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure dblcEstadoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
  private
    { Private declarations }
    Cidade: TCtrlCidade;
    Estado: TCtrlEstado;
    procedure Seleciona( IdCidade: Double = 0 );
  public
    { Public declarations }
  end;

var
  FrmCadCidade: TFrmCadCidade;

implementation

{$R *.DFM}

Uses uMensErro, dBasedados, uSistema, uMidasUtil;

procedure TFrmCadCidade.Seleciona( IdCidade: Double = 0 );
begin
  cds.Data := Cidade.ListaCidade( 0, 0, IdCidade );
end;

procedure TFrmCadCidade.FormCreate(Sender: TObject);
begin
  inherited;
  Estado   := TCtrlEstado.Create;
  Estado.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Cidade := TCtrlCidade.Create;
  Cidade.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Cidade.cds := cds;
  CdsEstado.Data := Estado.ListaEstado();
  Seleciona( -1 );
end;

procedure TFrmCadCidade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Cidade.Free;
  Estado.Free;
end;

procedure TFrmCadCidade.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ) );
     EdPais.Text := cdsEstado.FieldByName('NOMEPAIS'{ivlm}).AsString;
  End;
end;

procedure TFrmCadCidade.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Cidade.Gravar;
end;

procedure TFrmCadCidade.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Cidade.Gravar;
end;

procedure TFrmCadCidade.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Cidade.Gravar;
end;

procedure TFrmCadCidade.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( Cidade.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TFrmCadCidade.dblcEstadoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If cds.State In [dsInsert, dsEdit] then
   begin
     EdPais.Text := cdsEstado.FieldByName('NOMEPAIS'{ivlm}).AsString;
     //Brunno Mattos - SOL 148787 - KTN 1055436 - Início
     cds.FieldByName('CODESTADO').value := cdsEstado.FieldByName('CODESTADO').Value;
     cds.FieldByName('UF').value := cdsEstado.FieldByName('CODESTADO').Value;
     //Brunno Mattos - SOL 148787 - KTN 1055436 - Fim
   end;
end;

procedure TFrmCadCidade.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  EdPais.Text := cdsEstado.FieldByName('NOMEPAIS'{ivlm}).AsString;
end;

procedure TFrmCadCidade.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  EdPais.Text := '';
  dbedNome.SetFocus;
end;

procedure TFrmCadCidade.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedNome.SetFocus;
end;

procedure TFrmCadCidade.sbtnInserirClick(Sender: TObject);
//Brunno Mattos - SOL 148787 - KTN 1055436 - Início
var
   Qry : TwwQuery;
begin
  inherited;
  If cds.State In [dsInsert, dsEdit] then
  begin
     Try
        Qry := TwwQuery.Create(nil);
        Qry.DataBaseName := 'baseDados';
        Qry.Close;
        Qry.Sql.Clear;
        Qry.Sql.Add('SELECT CM.SEQCIDADES.NEXTVAL IDCIDADES FROM DUAL');
        Qry.Open;
          if Not(Qry.IsEmpty) then
          begin
            //Garante que o CODMUNICIPIO será = ao IDCIDADES
            DbEdCodMunMF.Text := Qry.FieldByName('IDCIDADES').AsString;
            Cds.FieldByName('CODMUNICIPIO').Value := Qry.FieldByName('IDCIDADES').AsString;
            Cds.FieldByName('IDCIDADES').Value := Qry.FieldByName('IDCIDADES').AsString;
          end
          else
            DbEdCodMunMF.Text := '';
     Finally
       FreeAndNil(Qry);
     end;
  end;
//Brunno Mattos - SOL 148787 - KTN 1055436 - Fim
end;

end.

