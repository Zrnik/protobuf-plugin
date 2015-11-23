<?php
/**
 * Generated by Protobuf protoc plugin.
 */


namespace ProtobufCompilerTest\Protos;

/**
 * Protobuf message : PhoneNumber
 *
 * @\Protobuf\Annotation\Descriptor(
 *   name="PhoneNumber",
 *   package="ProtobufCompilerTest.Protos",
 *   fields={
 *     @\Protobuf\Annotation\Field(
 *       name="number",
 *       tag=1,
 *       type=9,
 *       label=2
 *     ),
 *     @\Protobuf\Annotation\Field(
 *       name="type",
 *       tag=2,
 *       type=14,
 *       label=1,
 *       default="HOME",
 *       reference="ProtobufTest.Protos.Person.PhoneType"
 *     )
 *   },
 *   extensions={
 *   }
 * )
 */
class PhoneNumber extends \Protobuf\AbstractMessage
{

    /**
     * @var \Protobuf\UnknownFieldSet
     */
    protected $unknownFieldSet = null;

    /**
     * @var \Protobuf\ExtensionFieldMap
     */
    protected $extensions = null;

    /**
     * number required string = 1
     *
     * @var string
     */
    protected $number = null;

    /**
     * type optional enum = 2
     *
     * @var \ProtobufTest\Protos\Person\PhoneType
     */
    protected $type = null;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->type = \ProtobufTest\Protos\Person\PhoneType::HOME();
    }

    /**
     * Check if 'number' has a value
     *
     * @return bool
     */
    public function hasNumber()
    {
        return $this->number !== null;
    }

    /**
     * Get 'number' value
     *
     * @return string
     */
    public function getNumber()
    {
        return $this->number;
    }

    /**
     * Set 'number' value
     *
     * @param string $value
     */
    public function setNumber($value)
    {
        return $this->number = $value;
    }

    /**
     * Check if 'type' has a value
     *
     * @return bool
     */
    public function hasType()
    {
        return $this->type !== null;
    }

    /**
     * Get 'type' value
     *
     * @return \ProtobufTest\Protos\Person\PhoneType
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set 'type' value
     *
     * @param \ProtobufTest\Protos\Person\PhoneType $value
     */
    public function setType(\ProtobufTest\Protos\Person\PhoneType $value)
    {
        return $this->type = $value;
    }

    /**
     * Get unknown values
     *
     * @return \Protobuf\UnknownFieldSet
     */
    public function unknownFieldSet()
    {
        return $this->unknownFieldSet;
    }

    /**
     * {@inheritdoc}
     *
     * @return \Protobuf\ExtensionFieldMap
     */
    public function extensions()
    {
        if ( $this->extensions !== null) {
            return $this->extensions;
        }

        return $this->extensions = new \Protobuf\ExtensionFieldMap();
    }

    /**
     * {@inheritdoc}
     */
    public function serializedSize(\Protobuf\ComputeSizeContext $context)
    {
        $calculator = $context->getSizeCalculator();
        $size       = 0;

        if ($this->number !== null) {
            $size += 1;
            $size += $calculator->computeStringSize($this->number);
        }

        if ($this->type !== null) {
            $size += 1;
            $size += $calculator->computeVarintSize($this->type->value());
        }

        return $size;
    }

    /**
     * {@inheritdoc}
     */
    public function toStream(\Protobuf\Configuration $configuration = null)
    {
        $config  = $configuration ?: \Protobuf\Configuration::getInstance();
        $context = $config->createWriteContext();
        $stream  = $context->getStream();

        $this->writeTo($context);
        $stream->seek(0);

        return $stream;
    }

    /**
     * {@inheritdoc}
     */
    public function readFrom(\Protobuf\ReadContext $context)
    {
        $reader = $context->getReader();
        $length = $context->getLength();
        $stream = $context->getStream();

        $limit = ($length !== null)
            ? ($stream->tell() + $length)
            : null;

        while ($limit === null || $stream->tell() < $limit) {

            if ($stream->eof()) {
                break;
            }

            $key  = $reader->readVarint($stream);
            $wire = \Protobuf\WireFormat::getTagWireType($key);
            $tag  = \Protobuf\WireFormat::getTagFieldNumber($key);

            if ($stream->eof()) {
                break;
            }

            if ($tag === 1) {
                \Protobuf\WireFormat::assertWireType($wire, 9);

                $this->number = $reader->readString($stream);

                continue;
            }

            if ($tag === 2) {
                \Protobuf\WireFormat::assertWireType($wire, 14);

                $this->type = \ProtobufTest\Protos\Person\PhoneType::valueOf($reader->readVarint($stream));

                continue;
            }

            if ($this->unknownFieldSet === null) {
                $this->unknownFieldSet = new \Protobuf\UnknownFieldSet();
            }

            $data    = $reader->readUnknown($stream, $wire);
            $unknown = new \Protobuf\Unknown($tag, $wire, $data);

            $this->unknownFieldSet->add($unknown);

        }
    }

    /**
     * {@inheritdoc}
     */
    public function writeTo(\Protobuf\WriteContext $context)
    {
        $stream      = $context->getStream();
        $writer      = $context->getWriter();
        $sizeContext = $context->getComputeSizeContext();

        if ($this->number === null) {
            throw new \UnexpectedValueException('Field "\\ProtobufCompilerTest\\Protos\\PhoneNumber#number" (tag 1) is required but has no value.');
        }

        if ($this->number !== null) {
            $writer->writeVarint($stream, 10);
            $writer->writeString($stream, $this->number);
        }

        if ($this->type !== null) {
            $writer->writeVarint($stream, 16);
            $writer->writeVarint($stream, $this->type->value());
        }

        if ($this->extensions !== null) {
            $this->extensions->writeTo($context);
        }

        return $stream;
    }

    /**
     * {@inheritdoc}
     */
    public static function fromStream($stream, \Protobuf\Configuration $configuration = null)
    {
        $config  = $configuration ?: \Protobuf\Configuration::getInstance();
        $context = new \Protobuf\ReadContext($stream, $config->getStreamReader());
        $message = new \ProtobufCompilerTest\Protos\PhoneNumber();

        $message->readFrom($context);

        return $message;
    }


}

