{-------------------------------------------------------------------------------
CRIAÇÃO:
--------------------------------------------------------------------------------
Pendência   : SIG113126
Responsável : Ewerton Beltramini
Data        : 05/11/2021
Descrição   : Criação de form para importação de dados dos informes IR.
-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES
--------------------------------------------------------------------------------

Pendência   : SIG123664
Responsável : Ewerton Beltramini
Data        : 17/03/2022
Descrição   : Correções na verifiação do contrato.
---------------------------------------------------------------------------------}

unit FImportacaoInformeIR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, StdCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uMensErro,dBaseDados, UDataBase,
  SdfData, Spin, ADODB, ComObj;

type
  TFrmImportacaoInformeIR = class(TfrmOkCancelar)
    btnLimpaArquivo: TBitBtn;
    Label2: TLabel;
    qry: TwwQuery;
    ds: TwwDataSource;
    memArquivo: TMemo;
    qryDel: TwwQuery;
    qryInsert: TwwQuery;
    EdtNum: TSpinEdit;
    Label1: TLabel;
    EdtContrato: TEdit;
    procedure btnLimpaArquivoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FazerRefresh;
    procedure EdtContratoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmImportacaoInformeIR: TFrmImportacaoInformeIR;

implementation

{$R *.DFM}

procedure TFrmImportacaoInformeIR.btnLimpaArquivoClick(Sender: TObject);
begin
  inherited;
  EdtContrato.Clear;
  memArquivo.Clear;
end;

procedure TFrmImportacaoInformeIR.bbtnConfirmarClick(Sender: TObject);
var
excel :variant;
ilinha,icoluna: integer;
bSair, bContinuar : boolean;
sSaldoanterior, sSaldoatual, sSaldoinadant, sSaldoinadatual, sValorespagos, sCpf, sInfComplementares : String;
SP_PROC: TStoredProc;

begin
  inherited;

  if (IntToStr(edtNum.value) = '') then
  begin
       MsgDlg('É necessário informar o Ano de referência.', 'Empréstimo', mtWarning, [mbOK], 0);
       Exit;
  end;

  memArquivo.Lines.Add('Preparando para a importação...');

  if EdtContrato.Text <> '' then
  begin

       qry.Close;
       qry.sql.clear;
       qry.Sql.Add('select * from contratoemptmo where IDCONTRATOEMPTMO = ' + quotedStr(Trim(EdtContrato.Text)));      //Ewerton Beltramini - 17/03/2022 - SIG123664
       qry.open;

       if qry.IsEmpty then //Ewerton Beltramini - 17/03/2022 - SIG123664
       begin
            if MsgDlg('O Nº do Contrato informado não foi localizado!' + #13 + 'Deseja desconsiderar e continuar? .', 'Empréstimo', mtWarning, [mbYes,mbNO], 0) = mrYES  then
            begin
                 EdtContrato.Text := '';
                 memArquivo.Lines.Add('Nº do Contrato desconsiderado.');
            end
            else
            begin
                 Exit;
            end;
       end;
  end;

  try
        memArquivo.Lines.Add('Iniciando a importação... ');
        try
           if not dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.StartTransaction;

            SP_PROC := TStoredProc.Create(Application);
            SP_PROC.DatabaseName   := dtmBaseDados.dbBaseDados.DataBaseName;
            SP_PROC.StoredProcName := 'CM.INFORME_IR_EMP';

            SP_PROC.Params.CreateParam(ftInteger, 'pAnoBase', ptinput);
            SP_PROC.Params.CreateParam(ftString, 'pNumContrato', ptinput);               //Ewerton Beltramini - 17/03/2022 - SIG123664

            SP_PROC.ParamByName('pAnoBase').AsInteger :=  EdtNum.Value;

            if (EdtContrato.Text <> '') then
               SP_PROC.ParamByName('pNumContrato').AsString := trim(EdtContrato.Text)    //Ewerton Beltramini - 17/03/2022 - SIG123664
            else
               SP_PROC.ParamByName('pNumContrato').AsString :=  '0';                     //Ewerton Beltramini - 17/03/2022 - SIG123664 

            memArquivo.Lines.Add('Importando... (aguarde o término)');
            SP_PROC.Prepare;
            SP_PROC.ExecProc;

            dtmBaseDados.dbBaseDados.Commit;

        finally
            SP_PROC.Close;
            FreeAndNil(SP_PROC);
        end;

        memArquivo.Lines.Add('Dados do informe do IR (' + IntToStr(EdtNum.value) + ') foram importados com sucesso!');
        
  Except
        dtmBaseDados.dbBaseDados.Rollback;
        btnLimpaArquivo.Click;
  end;

end;

procedure TFrmImportacaoInformeIR.FormCreate(Sender: TObject);
begin
  inherited;
  EdtNum.value := StrToInt(formatdatetime('yyyy',date));
end;

procedure TFrmImportacaoInformeIR.FazerRefresh;
begin
  qry.close;
  qry.open;
end;

procedure TFrmImportacaoInformeIR.EdtContratoExit(Sender: TObject);
begin
  inherited;
       if EdtContrato.Text <> '' then
       begin
            qry.Close;
            qry.sql.clear;
            qry.Sql.Add('select * from contratoemptmo where IDCONTRATOEMPTMO = ' + quotedStr(Trim(EdtContrato.Text)));    //Ewerton Beltramini - 17/03/2022 - SIG123664
            qry.open;

            if qry.IsEmpty then       //Ewerton Beltramini - 17/03/2022 - SIG123664
                memArquivo.Lines.Add('Contrato não localizado! (Nº: ' + EdtContrato.Text + ')');
       end;
end;

end.
