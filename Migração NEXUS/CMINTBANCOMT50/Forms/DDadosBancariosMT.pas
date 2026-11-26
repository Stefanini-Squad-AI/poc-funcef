unit DDadosBancariosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, uCmSqlParams, uCMClientDataSet, Db, DBClient;

type
  TContaBancaria = Record
    Id :Real;
    Banco :String;
    NomeBanco :String;
    Agencia :String;
    Nomeagencia :String;
    Numero :String;
    Tipo :String;
    DescTipo :String;
    MascaraConta :string;
    MascaraAgencia :String;
    AgenciaFormat :String;
    NumeroFormat :String;
  End;

  TDtmDadosBancariosMT = class(TDataModule)
    MsContaCor: TMontaSelect;
    CdsBuscaContaDoc: TCMClientDataSet;
    SQLBuscaContaDoc: TCMSqlParams;
    CdsContaCor: TCMClientDataSet;
    SQLContaCor: TCMSqlParams;
    CdsBuscaContaDocForn: TCMClientDataSet;
    SQLBuscaContaDocForn: TCMSqlParams;
    SqlBuscaCC: TCMSqlParams;
    SqlBuscaNumSeqArq: TCMSqlParams;
    cdsBuscaCC: TCMClientDataSet;
    CDSBuscaNumSeqArq: TCMClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    ContaBancaria :TContaBancaria;
    procedure SetaContaPreferencial(iIdForCli:Real; DataSet: TDataSet);
    procedure SetaFiltroMs(iIdForCli:Real);
    procedure BuscaContaDoc(CodDocumento :Real);
    Function BuscaLInhaTrocaFiltro(iOrdemdoFiltro:ShortInt; LstBusca: TStrings):Integer;
  end;

implementation

{$R *.DFM}

Uses Mask;

procedure TDtmDadosBancariosMT.SetaFiltroMs(iIdForCli:Real);
Begin
   MsContaCor.Filtro.Clear;
   MsContaCor.Filtro.Add('PESSOA.IDPESSOA = BANCO.IDPESSOA');
   MsContaCor.Filtro.Add('AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA');
   MsContaCor.Filtro.Add('CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA');
   MsContaCor.Filtro.Add('CONTABANCARIA.IDPESSOA = ' + FloatToStr(iIdForCli));
End;

procedure TDtmDadosBancariosMT.SetaContaPreferencial(iIdForCli:Real; DataSet: TDataSet);
Begin
   SQLContaCor.Prepare;
   SQLContaCor.ParamByName('IDPESSOA').AsFloat := iIdForCli;
   SQLContaCor.Open;

   If Not CdsContaCor.IsEmpty Then
   Begin
      With DataSet Do
      Begin
         If Not (State In [DsEdit, DsInsert]) Then Edit;
         FieldByName('IDCBANCARIA').AsFloat := CdsContaCor.FieldByName('IDCBANCARIA').AsFloat;
         FieldByName('CONTACORRENTE').AsString := CdsContaCor.FieldByName('CONTACORRENTE').AsString;
         FieldByName('NUMBANCO').AsString := CdsContaCor.FieldByName('NUMBANCO').AsString;
         FieldByName('NUMAGENCIA').AsString := CdsContaCor.FieldByName('NUMAGENCIA').AsString;
         FieldByName('DESCTIPOCONTA').AsString := CdsContaCor.FieldByName('DESCTIPOCONTA').AsString;
      End;
   End Else
   Begin
      With DataSet Do
      Begin
         If Not (State In [DsEdit, DsInsert]) Then Edit;
         FieldByName('IDCBANCARIA').Clear;
         FieldByName('CONTACORRENTE').Clear;
         FieldByName('NUMBANCO').Clear;
         FieldByName('NUMAGENCIA').Clear;
         FieldByName('DESCTIPOCONTA').Clear;
      End;
   End;

   If CdsContaCor.Active Then CdsContaCor.Close;
End;

procedure TDtmDadosBancariosMT.BuscaContaDoc(CodDocumento :Real);
Begin
  SQLBuscaContaDoc.Prepare;
  SQLBuscaContaDoc.ParamByName('CODDOCUMENTO').AsFloat := CodDocumento;
  SQLBuscaContaDoc.Open;

  If Not CdsBuscaContaDoc.IsEmpty Then
  Begin
     with ContaBancaria Do
     Begin
        Id := CdsBuscaContaDoc.FieldByName('IDCBANCARIA').AsFloat;
        Banco := CdsBuscaContaDoc.FieldByName('NUMBANCO').AsString;
        NomeBanco := CdsBuscaContaDoc.FieldByName('NOMEBANCO').AsString;
        Agencia := CdsBuscaContaDoc.FieldByName('NUMAGENCIA').AsString;
        Nomeagencia := CdsBuscaContaDoc.FieldByName('NOMEAGENCIA').AsString;
        Numero := CdsBuscaContaDoc.FieldByName('CONTACORRENTE').AsString;
        DescTipo := CdsBuscaContaDoc.FieldByName('DESCTIPOCONTA').AsString;
        Tipo := CdsBuscaContaDoc.FieldByName('TIPOCONTA').AsString;
        If CdsBuscaContaDoc.FieldByName('MASCARACC').IsNull Then
        Begin
           MascaraConta := '';
           NumeroFormat := Numero;;
        End
        Else
        Begin
           MascaraConta := CdsBuscaContaDoc.FieldByName('MASCARACC').AsString + ';0; ';
           NumeroFormat := FormatMasktext(MascaraConta,Numero);
        End;

        If CdsBuscaContaDoc.FieldByName('MASCARACC').IsNull Then
        Begin
           MascaraAgencia := '';
           AgenciaFormat := Agencia;
        End
        Else
        Begin
           MascaraAgencia := CdsBuscaContaDoc.FieldByName('MASCARAAGENCIA').AsString + ';0; ';
           AgenciaFormat := FormatMasktext(MascaraAgencia,Agencia);
        End;
     End;
  End
  Else
  Begin
     SQLBuscaContaDocForn.Prepare;
     SQLBuscaContaDocForn.ParamByName('CODDOCUMENTO').AsFloat := CodDocumento;
     SQLBuscaContaDocForn.Open;

     If Not CdsBuscaContaDocForn.IsEmpty Then
     Begin
        with ContaBancaria Do
        Begin
           Id := CdsBuscaContaDocForn.FieldByName('IDCBANCARIA').AsFloat;
           Banco := CdsBuscaContaDocForn.FieldByName('NUMBANCO').AsString;
           NomeBanco := CdsBuscaContaDocForn.FieldByName('NOMEBANCO').AsString;
           Agencia := CdsBuscaContaDocForn.FieldByName('NUMAGENCIA').AsString;
           Nomeagencia := CdsBuscaContaDocForn.FieldByName('NOMEAGENCIA').AsString;
           Numero := CdsBuscaContaDocForn.FieldByName('CONTACORRENTE').AsString;
           DescTipo := CdsBuscaContaDocForn.FieldByName('DESCTIPOCONTA').AsString;
           Tipo := CdsBuscaContaDocForn.FieldByName('TIPOCONTA').AsString;

           If CdsBuscaContaDocForn.FieldByName('MASCARACC').IsNull Then
           Begin
              MascaraConta := '';
              NumeroFormat := Numero;
           End
           Else
           Begin
              MascaraConta := CdsBuscaContaDocForn.FieldByName('MASCARACC').AsString + ';0; ';
              NumeroFormat := FormatMasktext(MascaraConta,Numero);
           End;

           If CdsBuscaContaDocForn.FieldByName('MASCARAAGENCIA').IsNull Then
           Begin
              MascaraAgencia := '';
              AgenciaFormat := Agencia;
           End
           Else
           Begin
              MascaraAgencia := CdsBuscaContaDocForn.FieldByName('MASCARAAGENCIA').AsString + ';0; ';
              AgenciaFormat := FormatMasktext(MascaraAgencia,Agencia);
           End;
        End;
     End
     Else
     Begin
        with ContaBancaria Do
        Begin
           Id := -1;
           Banco := '';
           NomeBanco := '';
           Agencia := '';
           Nomeagencia := '';
           Numero := '';
           DescTipo := '';
           Tipo := '0';
           MascaraConta := '';
           MascaraAgencia := '';
           AgenciaFormat := '';
           NumeroFormat := '';
        End;
     End;
     
     CdsBuscaContaDocForn.Close;
  End;
  CdsBuscaContaDoc.Close;
End;

Function TDtmDadosBancariosMT.BuscaLInhaTrocaFiltro(iOrdemdoFiltro:ShortInt; LstBusca: TStrings):Integer;
Begin
  Result := LstBusca.IndexOf('-- #ADF' + IntToStr(iOrdemdoFiltro));
  
  If Result = -1 Then
     Raise Exception.Create('Erro ao filtrar relatório por Centro de Custo/Data na posição "' + IntToStr(iOrdemdoFiltro) +'".');
End;

end.

